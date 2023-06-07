import '../model/student_satte.dart';

class StudentState {
  bool isloading;
  List<Student> students;

  StudentState({
    required this.isloading,
    required this.students,
  });
  //initial state
  StudentState.initalState()
      : this(
          isloading: false,
          students: [],
        );

  StudentState copyWith({
    bool? isloading,
    List<Student>? students,
  }) {
    return StudentState(
      isloading: isloading ?? this.isloading,
      students: students ?? this.students,
    );
  }
}
