
import 'package:flutter/material.dart';

class ExpensesTrack extends StatelessWidget {
  const ExpensesTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: MaterialApp(
        
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Expenses Tracker'),
          ),
          body: const Center(
            child: Text('Hello World!'),
          ),
        ),
      ),
    );
  }
}