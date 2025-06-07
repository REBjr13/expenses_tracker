import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class DatePick extends StatefulWidget {
  const DatePick({super.key});

  @override
  State<DatePick> createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
    DateTime? _selectedDate;

     void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 2, now.month - 1, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _selectedDate == null
                ? "No date selected"
                : formatter.format(_selectedDate!),
          ),
          IconButton(
            onPressed: _presentDatePicker,
            icon: Icon(Icons.calendar_month),
          ),
        ],
      ),
    );
  }
}
