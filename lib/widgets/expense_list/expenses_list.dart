// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //use listView if you do not know the amount of data in a list(automatically scrollable) items are created only when needed
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseItem(expenses[index]),
    );
  }
}
