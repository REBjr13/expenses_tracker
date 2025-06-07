import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({
    super.key,
    });

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  Category _selectedCategory = Category.leisure;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButton(
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
            _selectedCategory = value; // updates the dropdown current item
          });
        },
      ),
    );
  }
}
