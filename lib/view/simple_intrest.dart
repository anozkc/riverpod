import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimpleIntrest extends ConsumerStatefulWidget {
  const SimpleIntrest({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SimpleIntrestState();
}

class _SimpleIntrestState extends ConsumerState<SimpleIntrest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple interest"),
      ),
      
    );
  }
}
