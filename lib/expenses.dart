import 'package:flutter/material.dart';

class ExpensesTrack extends StatefulWidget {
  const ExpensesTrack({super.key});

  @override
  State<ExpensesTrack> createState() => _ExpensesTrackState();
}

class _ExpensesTrackState extends State<ExpensesTrack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expenses Tracker', textAlign: TextAlign.right,), backgroundColor: Colors.indigo, elevation: 40,),
      body: Column(
        children: [
           Center(child: Text('Hello World!')),
        ],
      ),
    );
  }
}
