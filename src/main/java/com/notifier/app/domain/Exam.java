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
 * A Exam.
 */
@Entity
@Table(name = "exam")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Document(indexName = "exam")
public class Exam implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @OneToMany(mappedBy = "exam")
    @JsonIgnore
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    private Set<Question> questions = new HashSet<>();

    @ManyToOne
    @NotNull
    private Course course;

    @OneToMany(mappedBy = "exam")
    @JsonIgnore
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    private Set<ExamResult> examResults = new HashSet<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public Exam name(String name) {
        this.name = name;
        return this;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Question> getQuestions() {
        return questions;
    }

    public Exam questions(Set<Question> questions) {
        this.questions = questions;
        return this;
    }

    public Exam addQuestion(Question question) {
        questions.add(question);
        question.setExam(this);
        return this;
    }

    public Exam removeQuestion(Question question) {
        questions.remove(question);
        question.setExam(null);
        return this;
    }

    public void setQuestions(Set<Question> questions) {
        this.questions = questions;
    }

    public Course getCourse() {
        return course;
    }

    public Exam course(Course course) {
        this.course = course;
        return this;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Set<ExamResult> getExamResults() {
        return examResults;
    }

    public Exam examResults(Set<ExamResult> examResults) {
        this.examResults = examResults;
        return this;
    }

    public Exam addExamResult(ExamResult examResult) {
        examResults.add(examResult);
        examResult.setExam(this);
        return this;
    }

    public Exam removeExamResult(ExamResult examResult) {
        examResults.remove(examResult);
        examResult.setExam(null);
        return this;
    }

    public void setExamResults(Set<ExamResult> examResults) {
        this.examResults = examResults;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Exam exam = (Exam) o;
        if(exam.id == null || id == null) {
            return false;
        }
        return Objects.equals(id, exam.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }

    @Override
    public String toString() {
        return "Exam{" +
            "id=" + id +
            ", name='" + name + "'" +
            '}';
    }
}
