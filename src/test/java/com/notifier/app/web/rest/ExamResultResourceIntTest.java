package com.notifier.app.web.rest;

import com.notifier.app.TestResultNotifierApp;

import com.notifier.app.domain.ExamResult;
import com.notifier.app.domain.User;
import com.notifier.app.domain.Question;
import com.notifier.app.domain.Answer;
import com.notifier.app.domain.Course;
import com.notifier.app.domain.Exam;
import com.notifier.app.repository.ExamResultRepository;
import com.notifier.app.repository.search.ExamResultSearchRepository;

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
 * Test class for the ExamResultResource REST controller.
 *
 * @see ExamResultResource
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = TestResultNotifierApp.class)
public class ExamResultResourceIntTest {

    @Inject
    private ExamResultRepository examResultRepository;

    @Inject
    private ExamResultSearchRepository examResultSearchRepository;

    @Inject
    private MappingJackson2HttpMessageConverter jacksonMessageConverter;

    @Inject
    private PageableHandlerMethodArgumentResolver pageableArgumentResolver;

    @Inject
    private EntityManager em;

    private MockMvc restExamResultMockMvc;

    private ExamResult examResult;

    @PostConstruct
    public void setup() {
        MockitoAnnotations.initMocks(this);
        ExamResultResource examResultResource = new ExamResultResource();
        ReflectionTestUtils.setField(examResultResource, "examResultSearchRepository", examResultSearchRepository);
        ReflectionTestUtils.setField(examResultResource, "examResultRepository", examResultRepository);
        this.restExamResultMockMvc = MockMvcBuilders.standaloneSetup(examResultResource)
            .setCustomArgumentResolvers(pageableArgumentResolver)
            .setMessageConverters(jacksonMessageConverter).build();
    }

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static ExamResult createEntity(EntityManager em) {
        ExamResult examResult = new ExamResult();
        // Add required entity
        User student = UserResourceIntTest.createEntity(em);
        em.persist(student);
        em.flush();
        examResult.setStudent(student);
        // Add required entity
        Question question = QuestionResourceIntTest.createEntity(em);
        em.persist(question);
        em.flush();
        examResult.getQuestions().add(question);
        // Add required entity
        Answer answer = AnswerResourceIntTest.createEntity(em);
        em.persist(answer);
        em.flush();
        examResult.getAnswers().add(answer);
        // Add required entity
        Course course = CourseResourceIntTest.createEntity(em);
        em.persist(course);
        em.flush();
        examResult.setCourse(course);
        // Add required entity
        Exam exam = ExamResourceIntTest.createEntity(em);
        em.persist(exam);
        em.flush();
        examResult.setExam(exam);
        return examResult;
    }

    @Before
    public void initTest() {
        examResultSearchRepository.deleteAll();
        examResult = createEntity(em);
    }

    @Test
    @Transactional
    public void createExamResult() throws Exception {
        int databaseSizeBeforeCreate = examResultRepository.findAll().size();

        // Create the ExamResult

        restExamResultMockMvc.perform(post("/api/exam-results")
                .contentType(TestUtil.APPLICATION_JSON_UTF8)
                .content(TestUtil.convertObjectToJsonBytes(examResult)))
                .andExpect(status().isCreated());

        // Validate the ExamResult in the database
        List<ExamResult> examResults = examResultRepository.findAll();
        assertThat(examResults).hasSize(databaseSizeBeforeCreate + 1);
        ExamResult testExamResult = examResults.get(examResults.size() - 1);

        // Validate the ExamResult in ElasticSearch
        ExamResult examResultEs = examResultSearchRepository.findOne(testExamResult.getId());
        assertThat(examResultEs).isEqualToComparingFieldByField(testExamResult);
    }

    @Test
    @Transactional
    public void getAllExamResults() throws Exception {
        // Initialize the database
        examResultRepository.saveAndFlush(examResult);

        // Get all the examResults
        restExamResultMockMvc.perform(get("/api/exam-results?sort=id,desc"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
                .andExpect(jsonPath("$.[*].id").value(hasItem(examResult.getId().intValue())));
    }

    @Test
    @Transactional
    public void getExamResult() throws Exception {
        // Initialize the database
        examResultRepository.saveAndFlush(examResult);

        // Get the examResult
        restExamResultMockMvc.perform(get("/api/exam-results/{id}", examResult.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.id").value(examResult.getId().intValue()));
    }

    @Test
    @Transactional
    public void getNonExistingExamResult() throws Exception {
        // Get the examResult
        restExamResultMockMvc.perform(get("/api/exam-results/{id}", Long.MAX_VALUE))
                .andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    public void updateExamResult() throws Exception {
        // Initialize the database
        examResultRepository.saveAndFlush(examResult);
        examResultSearchRepository.save(examResult);
        int databaseSizeBeforeUpdate = examResultRepository.findAll().size();

        // Update the examResult
        ExamResult updatedExamResult = examResultRepository.findOne(examResult.getId());

        restExamResultMockMvc.perform(put("/api/exam-results")
                .contentType(TestUtil.APPLICATION_JSON_UTF8)
                .content(TestUtil.convertObjectToJsonBytes(updatedExamResult)))
                .andExpect(status().isOk());

        // Validate the ExamResult in the database
        List<ExamResult> examResults = examResultRepository.findAll();
        assertThat(examResults).hasSize(databaseSizeBeforeUpdate);
        ExamResult testExamResult = examResults.get(examResults.size() - 1);

        // Validate the ExamResult in ElasticSearch
        ExamResult examResultEs = examResultSearchRepository.findOne(testExamResult.getId());
        assertThat(examResultEs).isEqualToComparingFieldByField(testExamResult);
    }

    @Test
    @Transactional
    public void deleteExamResult() throws Exception {
        // Initialize the database
        examResultRepository.saveAndFlush(examResult);
        examResultSearchRepository.save(examResult);
        int databaseSizeBeforeDelete = examResultRepository.findAll().size();

        // Get the examResult
        restExamResultMockMvc.perform(delete("/api/exam-results/{id}", examResult.getId())
                .accept(TestUtil.APPLICATION_JSON_UTF8))
                .andExpect(status().isOk());

        // Validate ElasticSearch is empty
        boolean examResultExistsInEs = examResultSearchRepository.exists(examResult.getId());
        assertThat(examResultExistsInEs).isFalse();

        // Validate the database is empty
        List<ExamResult> examResults = examResultRepository.findAll();
        assertThat(examResults).hasSize(databaseSizeBeforeDelete - 1);
    }

    @Test
    @Transactional
    public void searchExamResult() throws Exception {
        // Initialize the database
        examResultRepository.saveAndFlush(examResult);
        examResultSearchRepository.save(examResult);

        // Search the examResult
        restExamResultMockMvc.perform(get("/api/_search/exam-results?query=id:" + examResult.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(examResult.getId().intValue())));
    }
}
