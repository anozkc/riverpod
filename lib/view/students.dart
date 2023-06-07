import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/view_model/student_view_model.dart';

import '../model/student_satte.dart';

class Students extends ConsumerStatefulWidget {
  const Students({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StudentsState();
}

class _StudentsState extends ConsumerState<Students> {
  var gap = const SizedBox(
    height: 8,
  );
  final firstController = TextEditingController(text: 'Anoj');
  final lastController = TextEditingController(text: 'kc');
  final dobController = TextEditingController(text: '2022-1-1');
  @override
  Widget build(BuildContext context) {
    //value change vako bela heri rakha,
    //change vayo vani listview ma dekhai deu

    var data = ref.watch(studentViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Students"),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: "first name",
            ),
          ),
          gap,
          TextFormField(
            decoration: const InputDecoration(
              labelText: "last name",
            ),
          ),
          gap,
          TextFormField(
            decoration: const InputDecoration(
              labelText: "D.O.B",
            ),
          ),
          gap,
          ElevatedButton(
            onPressed: () {
              Student students = Student(
                fname: firstController.text.trim(),
                lname: lastController.text.trim(),
                dob: dobController.text.trim(),
              );

              ref.read(studentViewModelProvider.notifier).addStudent(students);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Student Added Succesfully"),
                  duration: Duration(seconds: 1),
                  backgroundColor: Colors.teal,
                ),
              );
            },
            child: const Text("Add"),
          ),
          //list view ma data dekhau yedi changes aako xa vani
          data.students.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: data.students.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(data.students[index].fname!),
                        subtitle: Text(data.students[index].lname!),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                        ),
                      );
                    },
                  ),
                )
              //Natra malai dekhau
              : const Text('no data')
        ],
      ),
    );
  }
}
