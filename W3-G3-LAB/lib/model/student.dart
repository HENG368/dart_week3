import '../model/assignment.dart';
class Student {
  final String id;
  final String name;
  List<Assignment> assignments = [];
  //student could enroll many course
  Student({required this.id, required this.name});
}
