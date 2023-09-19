import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final int count = 1;

  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('This is counter: ${count}'),
    );
  }
}
