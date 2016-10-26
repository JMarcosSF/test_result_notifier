package com.notifier.app.web.rest;

import com.notifier.app.TestResultNotifierApp;

import com.notifier.app.domain.Exam;
import com.notifier.app.domain.Course;
import com.notifier.app.repository.ExamRepository;
import com.notifier.app.repository.search.ExamSearchRepository;

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
 * Test class for the ExamResource REST controller.
 *
 * @see ExamResource
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = TestResultNotifierApp.class)
public class ExamResourceIntTest {

    private static final String DEFAULT_NAME = "AAAAA";
    private static final String UPDATED_NAME = "BBBBB";

    @Inject
    private ExamRepository examRepository;

    @Inject
    private ExamSearchRepository examSearchRepository;

    @Inject
    private MappingJackson2HttpMessageConverter jacksonMessageConverter;

    @Inject
    private PageableHandlerMethodArgumentResolver pageableArgumentResolver;

    @Inject
    private EntityManager em;

    private MockMvc restExamMockMvc;

    private Exam exam;

    @PostConstruct
    public void setup() {
        MockitoAnnotations.initMocks(this);
        ExamResource examResource = new ExamResource();
        ReflectionTestUtils.setField(examResource, "examSearchRepository", examSearchRepository);
        ReflectionTestUtils.setField(examResource, "examRepository", examRepository);
        this.restExamMockMvc = MockMvcBuilders.standaloneSetup(examResource)
            .setCustomArgumentResolvers(pageableArgumentResolver)
            .setMessageConverters(jacksonMessageConverter).build();
    }

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static Exam createEntity(EntityManager em) {
        Exam exam = new Exam()
                .name(DEFAULT_NAME);
        // Add required entity
        Course course = CourseResourceIntTest.createEntity(em);
        em.persist(course);
        em.flush();
        exam.setCourse(course);
        return exam;
    }

    @Before
    public void initTest() {
        examSearchRepository.deleteAll();
        exam = createEntity(em);
    }

    @Test
    @Transactional
    public void createExam() throws Exception {
        int databaseSizeBeforeCreate = examRepository.findAll().size();

        // Create the Exam

        restExamMockMvc.perform(post("/api/exams")
                .contentType(TestUtil.APPLICATION_JSON_UTF8)
                .content(TestUtil.convertObjectToJsonBytes(exam)))
                .andExpect(status().isCreated());

        // Validate the Exam in the database
        List<Exam> exams = examRepository.findAll();
        assertThat(exams).hasSize(databaseSizeBeforeCreate + 1);
        Exam testExam = exams.get(exams.size() - 1);
        assertThat(testExam.getName()).isEqualTo(DEFAULT_NAME);

        // Validate the Exam in ElasticSearch
        Exam examEs = examSearchRepository.findOne(testExam.getId());
        assertThat(examEs).isEqualToComparingFieldByField(testExam);
    }

    @Test
    @Transactional
    public void checkNameIsRequired() throws Exception {
        int databaseSizeBeforeTest = examRepository.findAll().size();
        // set the field null
        exam.setName(null);

        // Create the Exam, which fails.

        restExamMockMvc.perform(post("/api/exams")
                .contentType(TestUtil.APPLICATION_JSON_UTF8)
                .content(TestUtil.convertObjectToJsonBytes(exam)))
                .andExpect(status().isBadRequest());

        List<Exam> exams = examRepository.findAll();
        assertThat(exams).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    public void getAllExams() throws Exception {
        // Initialize the database
        examRepository.saveAndFlush(exam);

        // Get all the exams
        restExamMockMvc.perform(get("/api/exams?sort=id,desc"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
                .andExpect(jsonPath("$.[*].id").value(hasItem(exam.getId().intValue())))
                .andExpect(jsonPath("$.[*].name").value(hasItem(DEFAULT_NAME.toString())));
    }

    @Test
    @Transactional
    public void getExam() throws Exception {
        // Initialize the database
        examRepository.saveAndFlush(exam);

        // Get the exam
        restExamMockMvc.perform(get("/api/exams/{id}", exam.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.id").value(exam.getId().intValue()))
            .andExpect(jsonPath("$.name").value(DEFAULT_NAME.toString()));
    }

    @Test
    @Transactional
    public void getNonExistingExam() throws Exception {
        // Get the exam
        restExamMockMvc.perform(get("/api/exams/{id}", Long.MAX_VALUE))
                .andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    public void updateExam() throws Exception {
        // Initialize the database
        examRepository.saveAndFlush(exam);
        examSearchRepository.save(exam);
        int databaseSizeBeforeUpdate = examRepository.findAll().size();

        // Update the exam
        Exam updatedExam = examRepository.findOne(exam.getId());
        updatedExam
                .name(UPDATED_NAME);

        restExamMockMvc.perform(put("/api/exams")
                .contentType(TestUtil.APPLICATION_JSON_UTF8)
                .content(TestUtil.convertObjectToJsonBytes(updatedExam)))
                .andExpect(status().isOk());

        // Validate the Exam in the database
        List<Exam> exams = examRepository.findAll();
        assertThat(exams).hasSize(databaseSizeBeforeUpdate);
        Exam testExam = exams.get(exams.size() - 1);
        assertThat(testExam.getName()).isEqualTo(UPDATED_NAME);

        // Validate the Exam in ElasticSearch
        Exam examEs = examSearchRepository.findOne(testExam.getId());
        assertThat(examEs).isEqualToComparingFieldByField(testExam);
    }

    @Test
    @Transactional
    public void deleteExam() throws Exception {
        // Initialize the database
        examRepository.saveAndFlush(exam);
        examSearchRepository.save(exam);
        int databaseSizeBeforeDelete = examRepository.findAll().size();

        // Get the exam
        restExamMockMvc.perform(delete("/api/exams/{id}", exam.getId())
                .accept(TestUtil.APPLICATION_JSON_UTF8))
                .andExpect(status().isOk());

        // Validate ElasticSearch is empty
        boolean examExistsInEs = examSearchRepository.exists(exam.getId());
        assertThat(examExistsInEs).isFalse();

        // Validate the database is empty
        List<Exam> exams = examRepository.findAll();
        assertThat(exams).hasSize(databaseSizeBeforeDelete - 1);
    }

    @Test
    @Transactional
    public void searchExam() throws Exception {
        // Initialize the database
        examRepository.saveAndFlush(exam);
        examSearchRepository.save(exam);

        // Search the exam
        restExamMockMvc.perform(get("/api/_search/exams?query=id:" + exam.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(exam.getId().intValue())))
            .andExpect(jsonPath("$.[*].name").value(hasItem(DEFAULT_NAME.toString())));
    }
}
