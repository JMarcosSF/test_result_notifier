package com.notifier.app.repository.search;

import com.notifier.app.domain.ExamResult;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

/**
 * Spring Data ElasticSearch repository for the ExamResult entity.
 */
public interface ExamResultSearchRepository extends ElasticsearchRepository<ExamResult, Long> {
}
