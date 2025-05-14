import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';


class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // var _enterTitle = '';
  // void _saveTitleInput(String inputValue) {
  //   _enterTitle = inputValue;
  // }

  final _titleControl = TextEditingController();
  final _amountControl = TextEditingController();
  DateTime? _selectedDate;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month - 1, now.day);
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
  void dispose() {
    _titleControl.dispose(); //always dispose texteditingcontrollers
    _amountControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            //TExt input element
            controller: _titleControl,
            maxLength: 50,
            decoration: InputDecoration(label: Text("Title")),
          ),
          SizedBox(),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountControl, //for the amount
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Amount"),
                    prefixText: '\$ ',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null ? "No date selected" : formatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  debugPrint(_titleControl.text);
                  debugPrint(_amountControl.text);
                },
                child: Text("Save Expense"),
              ),
              SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

