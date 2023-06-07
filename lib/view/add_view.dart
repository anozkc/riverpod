import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/arithmetic.dart';

//provider

final resultProvider = StateProvider<int>((ref) {
  return 0;
});

class AddView extends ConsumerStatefulWidget {
  const AddView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddViewState();
}

class _AddViewState extends ConsumerState<AddView> {
  final firstController = TextEditingController(text: '1');
  final secondController = TextEditingController(text: '2');
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Addition"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: firstController,
          ),
          TextFormField(
            controller: secondController,
          ),
          ElevatedButton(
            onPressed: () {
              int first = int.parse(firstController.text);
              int second = int.parse(secondController.text);
              var arithmetic = ref.read(arithmeticProvider);
              result = arithmetic.add(first, second);
              ref.read(resultProvider.notifier).state = result;
            },
            child: const Text("Add"),
          ),
          Text(
            ref.watch(resultProvider).toString(),
            style: const TextStyle(
              fontSize: 24,
            ),
           
           ),
        ],
      ),
    );
  }
}
