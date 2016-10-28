package com.notifier.app.repository;

import com.notifier.app.domain.Exam;

import org.springframework.data.jpa.repository.*;

import java.util.List;

/**
 * Spring Data JPA repository for the Exam entity.
 */
@SuppressWarnings("unused")
public interface ExamRepository extends JpaRepository<Exam,Long> {

    @Query("select exam from Exam exam where exam.course.teacher.login = ?#{principal.username}")
    List<Exam> findByTeacherIsCurrentUser();

}
