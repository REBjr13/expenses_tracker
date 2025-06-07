// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expenses_tracker/widgets/modal_display/amount_textfield.dart';
import 'package:expenses_tracker/widgets/modal_display/date_pick.dart';
import 'package:expenses_tracker/widgets/modal_display/dropdown_button.dart';
import 'package:expenses_tracker/widgets/modal_display/title_textfield.dart';
import 'package:flutter/material.dart';

import 'package:expenses_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

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
  final Category _selectedCategory = Category.leisure;

  
  void _submitForm() {
    final enteredAmount = double.tryParse(
      _amountControl.text,
    ); // tryParse yields a double if given one and null if given string
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleControl.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) // checks for empty spaces
    {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Invalid input'),
          content: Text("put valid data"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(
      Expense(
        title: _titleControl.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

 

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(
      context,
    ).viewInsets.bottom; //adds extra pixels when keyboard pops up
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final width = constraints.maxWidth;

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
            child: Column(
              //TODO: outsource these widgets to different files to reduce bulkyness
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextfield(),
                      SizedBox(width: 10),
                     AmountTextfield()
                    ],
                  )
                else
                 TitleTextfield(),

                if (width >= 600)
                  Row(
                    children: [
                      DropDownButton(),
                      SizedBox(width: 10),
                      DatePick(),
                    ],
                  )
                else
                  Row(
                    children: [
                     AmountTextfield(),
                      const SizedBox(width: 16),
                     DatePick(),
                    ],
                  ),
                const SizedBox(height: 20),
                if (width >= 600)
                  Row(
                    children: [
                      const Spacer(),
                      ElevatedButton(
                        onPressed: _submitForm,
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
                  )
                else
                  Row(
                    children: [
                      DropDownButton(),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: _submitForm,
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
          ),
        );
      },
    );
  }
}
