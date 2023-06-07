import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Create a provider
final numberProvider = StateProvider<int>(
  (ref) => 100,
);

final StringProvider = Provider<String>(
  (ref) => "Anoj",
);

//providerREF = provider-> provider
//WidgetRef = widget -> Provider

class CounterView extends ConsumerWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Column(
        children: [
          Text(
            ref.watch(numberProvider).toString(),
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          Text(
            ref.read(StringProvider),
            style: const TextStyle(
              fontSize: 24,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          //change the value of a provider
          ref.read(numberProvider.notifier).state++
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
