
import 'package:flutter/material.dart';

class ExpensesTrack extends StatefulWidget {
  const ExpensesTrack({super.key});

  @override
  State<ExpensesTrack> createState() => _ExpensesTrackState();
}

class _ExpensesTrackState extends State<ExpensesTrack> {
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