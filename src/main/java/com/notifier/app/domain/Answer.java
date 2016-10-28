package com.notifier.app.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.data.elasticsearch.annotations.Document;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import java.util.Objects;

/**
 * A Answer.
 */
@Entity
@Table(name = "answer")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Document(indexName = "answer")
public class Answer implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotNull
    @Column(name = "text", nullable = false)
    private String text;

    @NotNull
    @Column(name = "is_correct", nullable = false)
    private Boolean isCorrect;

    @ManyToMany(mappedBy = "answers")
    @JsonIgnore
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    private Set<ExamResult> examResults = new HashSet<>();

    @ManyToOne
    @NotNull
    private Question question;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public Answer text(String text) {
        this.text = text;
        return this;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Boolean isIsCorrect() {
        return isCorrect;
    }

    public Answer isCorrect(Boolean isCorrect) {
        this.isCorrect = isCorrect;
        return this;
    }

    public void setIsCorrect(Boolean isCorrect) {
        this.isCorrect = isCorrect;
    }

    public Set<ExamResult> getExamResults() {
        return examResults;
    }

    public Answer examResults(Set<ExamResult> examResults) {
        this.examResults = examResults;
        return this;
    }

    public Answer addExamResult(ExamResult examResult) {
        examResults.add(examResult);
        examResult.getAnswers().add(this);
        return this;
    }

    public Answer removeExamResult(ExamResult examResult) {
        examResults.remove(examResult);
        examResult.getAnswers().remove(this);
        return this;
    }

    public void setExamResults(Set<ExamResult> examResults) {
        this.examResults = examResults;
    }

    public Question getQuestion() {
        return question;
    }

    public Answer question(Question question) {
        this.question = question;
        return this;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Answer answer = (Answer) o;
        if(answer.id == null || id == null) {
            return false;
        }
        return Objects.equals(id, answer.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }

    @Override
    public String toString() {
        return "Answer{" +
            "id=" + id +
            ", text='" + text + "'" +
            ", isCorrect='" + isCorrect + "'" +
            '}';
    }
}
