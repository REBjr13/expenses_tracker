// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expenses_tracker/widgets/dropdown_button.dart';
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
  Category _selectedCategory = Category.leisure;

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
  void dispose() {
    _titleControl.dispose(); // always dispose texteditingcontrollers
    _amountControl.dispose();
    super.dispose();
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
                      Expanded(
                        child: TextField(
                          // TExt input element
                          controller: _titleControl,
                          maxLength: 50,
                          decoration: InputDecoration(label: Text("Title")),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _amountControl, // for the amount
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text("Amount"),
                            prefixText: '₦ ',
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  TextField(
                    // TExt input element
                    controller: _titleControl,
                    maxLength: 50,
                    decoration: InputDecoration(label: Text("Title")),
                  ),

                if (width >= 600)
                  Row(
                    children: [
                      DropDownButton(),
                      SizedBox(width: 10),
                      Expanded(
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
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _amountControl, // for the amount
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text("Amount"),
                            prefixText: '₦ ',
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                      ),
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
                      DropdownButton(
                        value: _selectedCategory,
                        items: Category.values
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(category.name.toUpperCase()),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _selectedCategory =
                                value; // updates the dropdown current item
                          });
                        },
                      ),
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
