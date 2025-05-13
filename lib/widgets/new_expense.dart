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
          TextField(
            controller: _amountControl,
            maxLength: 7,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(label: Text("Amount")),
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
              TextButton(onPressed: () {}, child: Text('Close')),
            ],
          ),
        ],
      ),
    );
  }
}
