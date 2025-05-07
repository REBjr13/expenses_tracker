// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:expenses_tracker/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense,{super.key });

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(child: Text(expense.title));
  }
}
