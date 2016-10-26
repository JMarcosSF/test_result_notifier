package com.notifier.app.repository.search;

import com.notifier.app.domain.Answer;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

/**
 * Spring Data ElasticSearch repository for the Answer entity.
 */
public interface AnswerSearchRepository extends ElasticsearchRepository<Answer, Long> {
}
