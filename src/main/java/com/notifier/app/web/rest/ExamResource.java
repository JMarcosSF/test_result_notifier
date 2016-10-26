package com.notifier.app.web.rest;

import com.codahale.metrics.annotation.Timed;
import com.notifier.app.domain.Exam;

import com.notifier.app.repository.ExamRepository;
import com.notifier.app.repository.search.ExamSearchRepository;
import com.notifier.app.web.rest.util.HeaderUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.validation.Valid;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import static org.elasticsearch.index.query.QueryBuilders.*;

/**
 * REST controller for managing Exam.
 */
@RestController
@RequestMapping("/api")
public class ExamResource {

    private final Logger log = LoggerFactory.getLogger(ExamResource.class);
        
    @Inject
    private ExamRepository examRepository;

    @Inject
    private ExamSearchRepository examSearchRepository;

    /**
     * POST  /exams : Create a new exam.
     *
     * @param exam the exam to create
     * @return the ResponseEntity with status 201 (Created) and with body the new exam, or with status 400 (Bad Request) if the exam has already an ID
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @RequestMapping(value = "/exams",
        method = RequestMethod.POST,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<Exam> createExam(@Valid @RequestBody Exam exam) throws URISyntaxException {
        log.debug("REST request to save Exam : {}", exam);
        if (exam.getId() != null) {
            return ResponseEntity.badRequest().headers(HeaderUtil.createFailureAlert("exam", "idexists", "A new exam cannot already have an ID")).body(null);
        }
        Exam result = examRepository.save(exam);
        examSearchRepository.save(result);
        return ResponseEntity.created(new URI("/api/exams/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert("exam", result.getId().toString()))
            .body(result);
    }

    /**
     * PUT  /exams : Updates an existing exam.
     *
     * @param exam the exam to update
     * @return the ResponseEntity with status 200 (OK) and with body the updated exam,
     * or with status 400 (Bad Request) if the exam is not valid,
     * or with status 500 (Internal Server Error) if the exam couldnt be updated
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @RequestMapping(value = "/exams",
        method = RequestMethod.PUT,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<Exam> updateExam(@Valid @RequestBody Exam exam) throws URISyntaxException {
        log.debug("REST request to update Exam : {}", exam);
        if (exam.getId() == null) {
            return createExam(exam);
        }
        Exam result = examRepository.save(exam);
        examSearchRepository.save(result);
        return ResponseEntity.ok()
            .headers(HeaderUtil.createEntityUpdateAlert("exam", exam.getId().toString()))
            .body(result);
    }

    /**
     * GET  /exams : get all the exams.
     *
     * @return the ResponseEntity with status 200 (OK) and the list of exams in body
     */
    @RequestMapping(value = "/exams",
        method = RequestMethod.GET,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public List<Exam> getAllExams() {
        log.debug("REST request to get all Exams");
        List<Exam> exams = examRepository.findAll();
        return exams;
    }

    /**
     * GET  /exams/:id : get the "id" exam.
     *
     * @param id the id of the exam to retrieve
     * @return the ResponseEntity with status 200 (OK) and with body the exam, or with status 404 (Not Found)
     */
    @RequestMapping(value = "/exams/{id}",
        method = RequestMethod.GET,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<Exam> getExam(@PathVariable Long id) {
        log.debug("REST request to get Exam : {}", id);
        Exam exam = examRepository.findOne(id);
        return Optional.ofNullable(exam)
            .map(result -> new ResponseEntity<>(
                result,
                HttpStatus.OK))
            .orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    /**
     * DELETE  /exams/:id : delete the "id" exam.
     *
     * @param id the id of the exam to delete
     * @return the ResponseEntity with status 200 (OK)
     */
    @RequestMapping(value = "/exams/{id}",
        method = RequestMethod.DELETE,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<Void> deleteExam(@PathVariable Long id) {
        log.debug("REST request to delete Exam : {}", id);
        examRepository.delete(id);
        examSearchRepository.delete(id);
        return ResponseEntity.ok().headers(HeaderUtil.createEntityDeletionAlert("exam", id.toString())).build();
    }

    /**
     * SEARCH  /_search/exams?query=:query : search for the exam corresponding
     * to the query.
     *
     * @param query the query of the exam search 
     * @return the result of the search
     */
    @RequestMapping(value = "/_search/exams",
        method = RequestMethod.GET,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public List<Exam> searchExams(@RequestParam String query) {
        log.debug("REST request to search Exams for query {}", query);
        return StreamSupport
            .stream(examSearchRepository.search(queryStringQuery(query)).spliterator(), false)
            .collect(Collectors.toList());
    }


}
