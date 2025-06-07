import 'package:flutter/material.dart';

class TitleTextfield extends StatefulWidget {
  const TitleTextfield({super.key});

  @override
  State<TitleTextfield> createState() => _TitleTextfieldState();
}

class _TitleTextfieldState extends State<TitleTextfield> {

   final _titleControl = TextEditingController();

    @override
  void dispose() {
    _titleControl.dispose(); // always dispose texteditingcontrollers
 
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
                        child: TextField(
                          // TExt input element
                          controller: _titleControl,
                          maxLength: 50,
                          decoration: InputDecoration(label: Text("Title")),
                        ),
                      );
  }
}