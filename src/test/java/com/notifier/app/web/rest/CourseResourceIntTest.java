package com.notifier.app.web.rest;

import com.notifier.app.TestResultNotifierApp;

import com.notifier.app.domain.Course;
import com.notifier.app.domain.User;
import com.notifier.app.repository.CourseRepository;
import com.notifier.app.repository.search.CourseSearchRepository;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import static org.hamcrest.Matchers.hasItem;
import org.mockito.MockitoAnnotations;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.data.web.PageableHandlerMethodArgumentResolver;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Test class for the CourseResource REST controller.
 *
 * @see CourseResource
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = TestResultNotifierApp.class)
public class CourseResourceIntTest {

    private static final String DEFAULT_NAME = "AAAAA";
    private static final String UPDATED_NAME = "BBBBB";

    @Inject
    private CourseRepository courseRepository;

    @Inject
    private CourseSearchRepository courseSearchRepository;

    @Inject
    private MappingJackson2HttpMessageConverter jacksonMessageConverter;

    @Inject
    private PageableHandlerMethodArgumentResolver pageableArgumentResolver;

    @Inject
    private EntityManager em;

    private MockMvc restCourseMockMvc;

    private Course course;

    @PostConstruct
    public void setup() {
        MockitoAnnotations.initMocks(this);
        CourseResource courseResource = new CourseResource();
        ReflectionTestUtils.setField(courseResource, "courseSearchRepository", courseSearchRepository);
        ReflectionTestUtils.setField(courseResource, "courseRepository", courseRepository);
        this.restCourseMockMvc = MockMvcBuilders.standaloneSetup(courseResource)
            .setCustomArgumentResolvers(pageableArgumentResolver)
            .setMessageConverters(jacksonMessageConverter).build();
    }

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static Course createEntity(EntityManager em) {
        Course course = new Course()
                .name(DEFAULT_NAME);
        // Add required entity
        User teacher = UserResourceIntTest.createEntity(em);
        em.persist(teacher);
        em.flush();
        course.setTeacher(teacher);
        return course;
    }

    @Before
    public void initTest() {
        courseSearchRepository.deleteAll();
        course = createEntity(em);
    }

    @Test
    @Transactional
    public void createCourse() throws Exception {
        int databaseSizeBeforeCreate = courseRepository.findAll().size();

        // Create the Course

        restCourseMockMvc.perform(post("/api/courses")
                .contentType(TestUtil.APPLICATION_JSON_UTF8)
                .content(TestUtil.convertObjectToJsonBytes(course)))
                .andExpect(status().isCreated());

        // Validate the Course in the database
        List<Course> courses = courseRepository.findAll();
        assertThat(courses).hasSize(databaseSizeBeforeCreate + 1);
        Course testCourse = courses.get(courses.size() - 1);
        assertThat(testCourse.getName()).isEqualTo(DEFAULT_NAME);

        // Validate the Course in ElasticSearch
        Course courseEs = courseSearchRepository.findOne(testCourse.getId());
        assertThat(courseEs).isEqualToComparingFieldByField(testCourse);
    }

    @Test
    @Transactional
    public void checkNameIsRequired() throws Exception {
        int databaseSizeBeforeTest = courseRepository.findAll().size();
        // set the field null
        course.setName(null);

        // Create the Course, which fails.

        restCourseMockMvc.perform(post("/api/courses")
                .contentType(TestUtil.APPLICATION_JSON_UTF8)
                .content(TestUtil.convertObjectToJsonBytes(course)))
                .andExpect(status().isBadRequest());

        List<Course> courses = courseRepository.findAll();
        assertThat(courses).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    public void getAllCourses() throws Exception {
        // Initialize the database
        courseRepository.saveAndFlush(course);

        // Get all the courses
        restCourseMockMvc.perform(get("/api/courses?sort=id,desc"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
                .andExpect(jsonPath("$.[*].id").value(hasItem(course.getId().intValue())))
                .andExpect(jsonPath("$.[*].name").value(hasItem(DEFAULT_NAME.toString())));
    }

    @Test
    @Transactional
    public void getCourse() throws Exception {
        // Initialize the database
        courseRepository.saveAndFlush(course);

        // Get the course
        restCourseMockMvc.perform(get("/api/courses/{id}", course.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.id").value(course.getId().intValue()))
            .andExpect(jsonPath("$.name").value(DEFAULT_NAME.toString()));
    }

    @Test
    @Transactional
    public void getNonExistingCourse() throws Exception {
        // Get the course
        restCourseMockMvc.perform(get("/api/courses/{id}", Long.MAX_VALUE))
                .andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    public void updateCourse() throws Exception {
        // Initialize the database
        courseRepository.saveAndFlush(course);
        courseSearchRepository.save(course);
        int databaseSizeBeforeUpdate = courseRepository.findAll().size();

        // Update the course
        Course updatedCourse = courseRepository.findOne(course.getId());
        updatedCourse
                .name(UPDATED_NAME);

        restCourseMockMvc.perform(put("/api/courses")
                .contentType(TestUtil.APPLICATION_JSON_UTF8)
                .content(TestUtil.convertObjectToJsonBytes(updatedCourse)))
                .andExpect(status().isOk());

        // Validate the Course in the database
        List<Course> courses = courseRepository.findAll();
        assertThat(courses).hasSize(databaseSizeBeforeUpdate);
        Course testCourse = courses.get(courses.size() - 1);
        assertThat(testCourse.getName()).isEqualTo(UPDATED_NAME);

        // Validate the Course in ElasticSearch
        Course courseEs = courseSearchRepository.findOne(testCourse.getId());
        assertThat(courseEs).isEqualToComparingFieldByField(testCourse);
    }

    @Test
    @Transactional
    public void deleteCourse() throws Exception {
        // Initialize the database
        courseRepository.saveAndFlush(course);
        courseSearchRepository.save(course);
        int databaseSizeBeforeDelete = courseRepository.findAll().size();

        // Get the course
        restCourseMockMvc.perform(delete("/api/courses/{id}", course.getId())
                .accept(TestUtil.APPLICATION_JSON_UTF8))
                .andExpect(status().isOk());

        // Validate ElasticSearch is empty
        boolean courseExistsInEs = courseSearchRepository.exists(course.getId());
        assertThat(courseExistsInEs).isFalse();

        // Validate the database is empty
        List<Course> courses = courseRepository.findAll();
        assertThat(courses).hasSize(databaseSizeBeforeDelete - 1);
    }

    @Test
    @Transactional
    public void searchCourse() throws Exception {
        // Initialize the database
        courseRepository.saveAndFlush(course);
        courseSearchRepository.save(course);

        // Search the course
        restCourseMockMvc.perform(get("/api/_search/courses?query=id:" + course.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(course.getId().intValue())))
            .andExpect(jsonPath("$.[*].name").value(hasItem(DEFAULT_NAME.toString())));
    }
}
