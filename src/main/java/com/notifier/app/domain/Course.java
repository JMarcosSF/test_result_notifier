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
 * A Course.
 */
@Entity
@Table(name = "course")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Document(indexName = "course")
public class Course implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @ManyToOne
    @NotNull
    private User teacher;

    @ManyToMany
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @JoinTable(name = "course_student",
               joinColumns = @JoinColumn(name="courses_id", referencedColumnName="ID"),
               inverseJoinColumns = @JoinColumn(name="students_id", referencedColumnName="ID"))
    private Set<User> students = new HashSet<>();

    @OneToMany(mappedBy = "course")
    @JsonIgnore
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    private Set<ExamResult> examResults = new HashSet<>();

    @OneToMany(mappedBy = "course")
    @JsonIgnore
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    private Set<Exam> exams = new HashSet<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public Course name(String name) {
        this.name = name;
        return this;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User getTeacher() {
        return teacher;
    }

    public Course teacher(User user) {
        this.teacher = user;
        return this;
    }

    public void setTeacher(User user) {
        this.teacher = user;
    }

    public Set<User> getStudents() {
        return students;
    }

    public Course students(Set<User> users) {
        this.students = users;
        return this;
    }

    public Course addStudent(User user) {
        students.add(user);
        return this;
    }

    public Course removeStudent(User user) {
        students.remove(user);
        return this;
    }

    public void setStudents(Set<User> users) {
        this.students = users;
    }

    public Set<ExamResult> getExamResults() {
        return examResults;
    }

    public Course examResults(Set<ExamResult> examResults) {
        this.examResults = examResults;
        return this;
    }

    public Course addExamResult(ExamResult examResult) {
        examResults.add(examResult);
        examResult.setCourse(this);
        return this;
    }

    public Course removeExamResult(ExamResult examResult) {
        examResults.remove(examResult);
        examResult.setCourse(null);
        return this;
    }

    public void setExamResults(Set<ExamResult> examResults) {
        this.examResults = examResults;
    }

    public Set<Exam> getExams() {
        return exams;
    }

    public Course exams(Set<Exam> exams) {
        this.exams = exams;
        return this;
    }

    public Course addExam(Exam exam) {
        exams.add(exam);
        exam.setCourse(this);
        return this;
    }

    public Course removeExam(Exam exam) {
        exams.remove(exam);
        exam.setCourse(null);
        return this;
    }

    public void setExams(Set<Exam> exams) {
        this.exams = exams;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Course course = (Course) o;
        if(course.id == null || id == null) {
            return false;
        }
        return Objects.equals(id, course.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }

    @Override
    public String toString() {
        return "Course{" +
            "id=" + id +
            ", name='" + name + "'" +
            '}';
    }
}
