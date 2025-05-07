import 'package:expenses_tracker/widgets/expenses_list.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesTrack extends StatefulWidget {
  const ExpensesTrack({super.key});

  @override
  State<ExpensesTrack> createState() => _ExpensesTrackState();
}

class _ExpensesTrackState extends State<ExpensesTrack> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Biscuit",
      amount: 500,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Taxi Ride",
      amount: 1500,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Movie Ticket",
      amount: 1200,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: "Groceries",
      amount: 3000,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Gym Membership",
      amount: 2500,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Hello World!'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
