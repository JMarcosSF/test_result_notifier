package com.notifier.app.repository;

import com.notifier.app.domain.ExamResult;

import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Spring Data JPA repository for the ExamResult entity.
 */
@SuppressWarnings("unused")
public interface ExamResultRepository extends JpaRepository<ExamResult,Long> {

    @Query("select distinct examResult from ExamResult examResult left join fetch examResult.questions left join fetch examResult.answers where examResult.student.login = ?#{principal.username}")
    List<ExamResult> findByStudentIsCurrentUser();

    @Query("select distinct examResult from ExamResult examResult left join fetch examResult.questions left join fetch examResult.answers where examResult.course.teacher.login = ?#{principal.username}")
    List<ExamResult> findByTeacherIsCurrentUser();

    @Query("select distinct examResult from ExamResult examResult left join fetch examResult.questions left join fetch examResult.answers")
    List<ExamResult> findAllWithEagerRelationships();

    @Query("select examResult from ExamResult examResult left join fetch examResult.questions left join fetch examResult.answers where examResult.id =:id")
    ExamResult findOneWithEagerRelationships(@Param("id") Long id);

}
