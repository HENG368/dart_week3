import 'package:lms_layered_architecture_example/model/assignment.dart';

import '../model/student.dart';
import '../model/course.dart';

class LmsSystem {
  final List<Student> students = [];
  final List<Course> courses = [];
  //course section
  void addCourse({required String courseId, required String courseName}) {
    Course? course = _findCourseOrNull(courseId);
    if (course != null) {
      throw Exception('Course $course already exists');
    }

    courses.add(Course(id: courseId, name: courseName));
  }

  void addStudentToCourse(
      {required String studentId, required String courseId}) {
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }

    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId not found');
    }
    course.studentIds.add(student.id);
  }

  Course? _findCourseOrNull(String courseId) {
    for (Course c in courses) {
      if (c.id == courseId) {
        return c;
      }
    }
    return null; // not found
  }

  void addAssignmentToStudent(String studentId, String courseId, String assignmentId) {
    Course? course_AssignTo = _findCourseOrNull(courseId);
    Student? student_AssignTo = _findStudentOrNull(studentId);
    if (student_AssignTo == null || course_AssignTo == null) {
      throw Exception("Student ID $studentId not found");
      return;
    }
    course_AssignTo.assignmentIds.add(assignmentId);
    student_AssignTo.assignments.add(Assignment(assingment_Id: assignmentId, score: 0));
  }

  
  //student section
  void addStudent({required String studentId, required String studentName}) {
    // ! Student shall not exist already
    Student? student = _findStudentOrNull(studentId);
    if (student != null) {
      throw Exception('Student $student already exists');
    }

    students.add(Student(id: studentId, name: studentName));
  }

  void removeStudent({required String studentId}) {
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }
    // 1- Remove student from the students list
    students.removeWhere((student) => student.id == studentId);
  }

  Student? _findStudentOrNull(String studentId) {
    for (Student s in students) {
      if (s.id == studentId) {
        return s;
      }
    }
    return null; // not found
  }

  // assignment section
  void addResult(String studentId, String courseId,String assignmentId, int score) {
    Course? course_AssignTo = _findCourseOrNull(courseId);
    Student? student_AssignTo = _findStudentOrNull(studentId);
    if (student_AssignTo == null || course_AssignTo == null) {
      throw Exception("Student ID $studentId not found");
      return;
    }
    course_AssignTo.assignmentIds.add(assignmentId);
    student_AssignTo.assignments.add(Assignment(assingment_Id: assignmentId, score: 0));

  }
  void removeResult(String studentId, String courseId,String assignmentId) {
    Course? course_AssignTo = _findCourseOrNull(courseId);
    Student? student_AssignTo = _findStudentOrNull(studentId);
    if (student_AssignTo == null || course_AssignTo == null) {
      throw Exception("Student ID $studentId not found");
      return;
    }
    course_AssignTo.assignmentIds.remove(assignmentId);
    student_AssignTo.assignments.removeWhere((assignment) => assignment.assingment_Id == assignmentId);
    
  }
  void removeStudentFromCourse(String studentId,String courseId) {
    Course? studentCourse= _findCourseOrNull(courseId);
    if (studentCourse == null) {
      throw Exception("Student ID $studentId not found");
      return;
    }
    studentCourse.studentIds.remove(studentId);
    students.removeWhere((student) => student.id ==studentId);
    
  }
}
