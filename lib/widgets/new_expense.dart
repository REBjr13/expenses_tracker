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

  @override
  void dispose() {
    _titleControl.dispose(); //always dispose texteditingcontrollers
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
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  debugPrint(_titleControl.text);
                },
                child: Text("Save Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
