import 'package:flutter/material.dart';


class AmountTextfield extends StatefulWidget {
  const AmountTextfield({super.key});

  @override
  State<AmountTextfield> createState() => _AmountTextfieldState();
}

class _AmountTextfieldState extends State<AmountTextfield> {
  final _amountControl = TextEditingController();

   @override
  void dispose() {
    // always dispose texteditingcontrollers
    _amountControl.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: _amountControl, // for the amount
        keyboardType: TextInputType.number,
        decoration: InputDecoration(label: Text("Amount"), prefixText: '₦ '),
      ),
    );
  }
}
