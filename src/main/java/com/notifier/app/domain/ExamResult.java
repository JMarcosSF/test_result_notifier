package com.notifier.app.domain;

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
 * A ExamResult.
 */
@Entity
@Table(name = "exam_result")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Document(indexName = "examresult")
public class ExamResult implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    @NotNull
    private User student;

    @ManyToMany
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @NotNull
    @JoinTable(name = "exam_result_question",
               joinColumns = @JoinColumn(name="exam_results_id", referencedColumnName="ID"),
               inverseJoinColumns = @JoinColumn(name="questions_id", referencedColumnName="ID"))
    private Set<Question> questions = new HashSet<>();

    @ManyToMany
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @NotNull
    @JoinTable(name = "exam_result_answer",
               joinColumns = @JoinColumn(name="exam_results_id", referencedColumnName="ID"),
               inverseJoinColumns = @JoinColumn(name="answers_id", referencedColumnName="ID"))
    private Set<Answer> answers = new HashSet<>();

    @ManyToOne
    @NotNull
    private Course course;

    @ManyToOne
    @NotNull
    private Exam exam;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getStudent() {
        return student;
    }

    public ExamResult student(User user) {
        this.student = user;
        return this;
    }

    public void setStudent(User user) {
        this.student = user;
    }

    public Set<Question> getQuestions() {
        return questions;
    }

    public ExamResult questions(Set<Question> questions) {
        this.questions = questions;
        return this;
    }

    public ExamResult addQuestion(Question question) {
        questions.add(question);
        question.getExamResults().add(this);
        return this;
    }

    public ExamResult removeQuestion(Question question) {
        questions.remove(question);
        question.getExamResults().remove(this);
        return this;
    }

    public void setQuestions(Set<Question> questions) {
        this.questions = questions;
    }

    public Set<Answer> getAnswers() {
        return answers;
    }

    public ExamResult answers(Set<Answer> answers) {
        this.answers = answers;
        return this;
    }

    public ExamResult addAnswer(Answer answer) {
        answers.add(answer);
        answer.getExamResults().add(this);
        return this;
    }

    public ExamResult removeAnswer(Answer answer) {
        answers.remove(answer);
        answer.getExamResults().remove(this);
        return this;
    }

    public void setAnswers(Set<Answer> answers) {
        this.answers = answers;
    }

    public Course getCourse() {
        return course;
    }

    public ExamResult course(Course course) {
        this.course = course;
        return this;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Exam getExam() {
        return exam;
    }

    public ExamResult exam(Exam exam) {
        this.exam = exam;
        return this;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ExamResult examResult = (ExamResult) o;
        if(examResult.id == null || id == null) {
            return false;
        }
        return Objects.equals(id, examResult.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }

    @Override
    public String toString() {
        return "ExamResult{" +
            "id=" + id +
            '}';
    }
}
