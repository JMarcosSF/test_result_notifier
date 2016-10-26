package com.notifier.app.repository.search;

import com.notifier.app.domain.Question;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

/**
 * Spring Data ElasticSearch repository for the Question entity.
 */
public interface QuestionSearchRepository extends ElasticsearchRepository<Question, Long> {
}
