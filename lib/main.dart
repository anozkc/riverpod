import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/view/add_view.dart';
import 'package:riverpod_state_management/view/counter_view.dart';
import 'package:riverpod_state_management/view/dashboard_view.dart';
import 'package:riverpod_state_management/view/simple_intrest.dart';
import 'package:riverpod_state_management/view/students.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Riverpod state management',
        initialRoute: '/',
        routes: {
          '/': (context) => const DashboardView(),
          '/counter': (context) => const CounterView(),
          '/add': (context) => const AddView(),
          '/simpleinterst': (context) => const SimpleIntrest(),
          '/student': (context) => const Students(),
        },
      ),
    ),
  );
}
