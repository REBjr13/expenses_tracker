// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/expense_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemovedExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemovedExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //use listView if you do not know the amount of data in a list(automatically scrollable) items are created only when needed
      itemCount: expenses.length,
      itemBuilder:
          (context, index) => Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error,
              margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal,//access data within like this
              ),
            ),
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              onRemovedExpense(expenses[index]);
            },
            child: ExpenseItem(expenses[index]),
          ),
    );
  }
}
