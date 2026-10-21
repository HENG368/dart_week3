import 'package:test/test.dart';

import '../service/lms_system.dart';
import '../model/course.dart';

void main() {
  test('creates a student', () {
    final lms = LmsSystem();

    // Create a student
    lms.addStudent(studentId: 'S1', studentName: "ronan");
    lms.addCourse(courseId: 'C1', courseName: 'Dart');
    lms.addStudentToCourse(studentId: 'S1', courseId: 'C1');
    expect(lms.students.first.name, 'ronan');
    expect(lms.courses.first.name, 'Dart');
    expect(lms.courses.first.studentIds.first,'S1');
    // Add an assignment to the student
    lms.addAssignmentToStudent('S1', 'C1', 'A1');
    expect(lms.students.first.assignments.first.assingment_Id, 'A1');
    // Remove the assignment from the student
    lms.removeResult('S1', 'C1', 'A1');
    expect(lms.students.first.assignments.length, 0);
    // Remove the student from the course
    lms.removeStudentFromCourse('S1', 'C1');
    expect(lms.courses.first.studentIds.length, 0); 
    // Remove the student
    lms.removeStudent(studentId: 'S1');
    expect(lms.students.length, 0);
  });
}
