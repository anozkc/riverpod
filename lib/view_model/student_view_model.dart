import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/student_satte.dart';
import '../state/student_state.dart';

//provider

final studentViewModelProvider =
    StateNotifierProvider<StudentViewModel, StudentState>(
  (ref) => StudentViewModel(),
);

class StudentViewModel extends StateNotifier<StudentState> {
  StudentViewModel() : super(StudentState.initalState()) {
    getAllStudent();
  }
  void getAllStudent() {
    state = state.copyWith(isloading: true);
    //get data from server
    state.students.add(Student(fname: "ASD", lname: "ASD", dob: "2022-1-1"));
    state.students.add(Student(fname: "DAS", lname: "ASD", dob: "2022-1-1"));
    state.students.add(Student(fname: "POO", lname: "ASD", dob: "2022-1-1"));
  }

  //Add student
  void addStudent(Student student) {
    //for showing progressbar
    state = state.copyWith(isloading: true);
    //server ma data halne
    state.students.add(student);
    //progress bar lai invisible banaunw ko lagi
    state = state.copyWith(isloading: false);
  }
}
