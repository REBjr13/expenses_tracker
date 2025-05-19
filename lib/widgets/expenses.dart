import 'package:expenses_tracker/widgets/expense_list/expenses_list.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/new_expense.dart';
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
  ];

  void _openAddExpenseScreen() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);//removes expense visually and internally
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses Tracker"),
        actionsPadding: const EdgeInsets.only(right: 45),
        actions: [
          IconButton(
            onPressed: _openAddExpenseScreen,
            icon: const Icon(Icons.play_arrow_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ExpensesList(expenses: _registeredExpenses, onRemovedExpense: _removeExpense,)),
        ],
      ),
    );
  }
}
