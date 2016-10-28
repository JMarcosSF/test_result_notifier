package com.notifier.app.web.rest;

import com.codahale.metrics.annotation.Timed;
import com.notifier.app.domain.ExamResult;

import com.notifier.app.repository.ExamResultRepository;
import com.notifier.app.repository.search.ExamResultSearchRepository;
import com.notifier.app.security.AuthoritiesConstants;
import com.notifier.app.security.SecurityUtils;
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
 * REST controller for managing ExamResult.
 */
@RestController
@RequestMapping("/api")
public class ExamResultResource {

    private final Logger log = LoggerFactory.getLogger(ExamResultResource.class);

    @Inject
    private ExamResultRepository examResultRepository;

    @Inject
    private ExamResultSearchRepository examResultSearchRepository;

    /**
     * POST  /exam-results : Create a new examResult.
     *
     * @param examResult the examResult to create
     * @return the ResponseEntity with status 201 (Created) and with body the new examResult, or with status 400 (Bad Request) if the examResult has already an ID
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @RequestMapping(value = "/exam-results",
        method = RequestMethod.POST,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<ExamResult> createExamResult(@Valid @RequestBody ExamResult examResult) throws URISyntaxException {
        log.debug("REST request to save ExamResult : {}", examResult);
        if (examResult.getId() != null) {
            return ResponseEntity.badRequest().headers(HeaderUtil.createFailureAlert("examResult", "idexists", "A new examResult cannot already have an ID")).body(null);
        }
        ExamResult result = examResultRepository.save(examResult);
        examResultSearchRepository.save(result);
        return ResponseEntity.created(new URI("/api/exam-results/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert("examResult", result.getId().toString()))
            .body(result);
    }

    /**
     * PUT  /exam-results : Updates an existing examResult.
     *
     * @param examResult the examResult to update
     * @return the ResponseEntity with status 200 (OK) and with body the updated examResult,
     * or with status 400 (Bad Request) if the examResult is not valid,
     * or with status 500 (Internal Server Error) if the examResult couldnt be updated
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @RequestMapping(value = "/exam-results",
        method = RequestMethod.PUT,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<ExamResult> updateExamResult(@Valid @RequestBody ExamResult examResult) throws URISyntaxException {
        log.debug("REST request to update ExamResult : {}", examResult);
        if (examResult.getId() == null) {
            return createExamResult(examResult);
        }
        ExamResult result = examResultRepository.save(examResult);
        examResultSearchRepository.save(result);
        return ResponseEntity.ok()
            .headers(HeaderUtil.createEntityUpdateAlert("examResult", examResult.getId().toString()))
            .body(result);
    }

    /**
     * GET  /exam-results : get all the examResults.
     *
     * @return the ResponseEntity with status 200 (OK) and the list of examResults in body
     */
    @RequestMapping(value = "/exam-results",
        method = RequestMethod.GET,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public List<ExamResult> getAllExamResults() {
        log.debug("REST request to get all ExamResults");
        List<ExamResult> examResults = null;

        if(SecurityUtils.isCurrentUserInRole(AuthoritiesConstants.TEACHER)) {
            log.debug(SecurityUtils.getCurrentUserLogin() + " is authority: " + AuthoritiesConstants.TEACHER);
            examResults = examResultRepository.findByTeacherIsCurrentUser();
        } else {
            examResults = examResultRepository.findAllWithEagerRelationships();
        }
        return examResults;
    }

    /**
     * GET  /exam-results/:id : get the "id" examResult.
     *
     * @param id the id of the examResult to retrieve
     * @return the ResponseEntity with status 200 (OK) and with body the examResult, or with status 404 (Not Found)
     */
    @RequestMapping(value = "/exam-results/{id}",
        method = RequestMethod.GET,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<ExamResult> getExamResult(@PathVariable Long id) {
        log.debug("REST request to get ExamResult : {}", id);
        ExamResult examResult = examResultRepository.findOneWithEagerRelationships(id);
        return Optional.ofNullable(examResult)
            .map(result -> new ResponseEntity<>(
                result,
                HttpStatus.OK))
            .orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    /**
     * DELETE  /exam-results/:id : delete the "id" examResult.
     *
     * @param id the id of the examResult to delete
     * @return the ResponseEntity with status 200 (OK)
     */
    @RequestMapping(value = "/exam-results/{id}",
        method = RequestMethod.DELETE,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<Void> deleteExamResult(@PathVariable Long id) {
        log.debug("REST request to delete ExamResult : {}", id);
        examResultRepository.delete(id);
        examResultSearchRepository.delete(id);
        return ResponseEntity.ok().headers(HeaderUtil.createEntityDeletionAlert("examResult", id.toString())).build();
    }

    /**
     * SEARCH  /_search/exam-results?query=:query : search for the examResult corresponding
     * to the query.
     *
     * @param query the query of the examResult search
     * @return the result of the search
     */
    @RequestMapping(value = "/_search/exam-results",
        method = RequestMethod.GET,
        produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public List<ExamResult> searchExamResults(@RequestParam String query) {
        log.debug("REST request to search ExamResults for query {}", query);
        return StreamSupport
            .stream(examResultSearchRepository.search(queryStringQuery(query)).spliterator(), false)
            .collect(Collectors.toList());
    }


}
