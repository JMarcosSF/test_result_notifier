package com.notifier.app.repository.search;

import com.notifier.app.domain.Exam;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

/**
 * Spring Data ElasticSearch repository for the Exam entity.
 */
public interface ExamSearchRepository extends ElasticsearchRepository<Exam, Long> {
}
