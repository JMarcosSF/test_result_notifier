package com.notifier.app.repository;

import com.notifier.app.domain.Course;

import com.notifier.app.domain.User;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Spring Data JPA repository for the Course entity.
 */
@SuppressWarnings("unused")
public interface CourseRepository extends JpaRepository<Course,Long> {

    @Query("select course from Course course where course.teacher.login = ?#{principal.username}")
    List<Course> findByTeacherIsCurrentUser();

    List<Course> findByStudents(User student);

    @Query("select distinct course from Course course left join fetch course.students")
    List<Course> findAllWithEagerRelationships();

    @Query("select course from Course course left join fetch course.students where course.id =:id")
    Course findOneWithEagerRelationships(@Param("id") Long id);

}
