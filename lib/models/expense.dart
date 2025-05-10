// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart'; //generates unique ID
import 'package:intl/intl.dart'; //for date formatting

final formatter = DateFormat.yMMMMEEEEd();

const uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work,
} //creates a custom type "predefined allowed values"

const categoryIcons = {
  Category.food: Icons.fastfood_outlined,
  Category.leisure: Icons.sports_gymnastics,
  Category.travel: Icons.flight_rounded,
  Category.work: Icons.work_rounded,
};

class Expense {
  final String title;
  final double amount;
  final DateTime date;
  final String id;
  final Category category;

  get formattedDate {
    return formatter.format(date);
  }

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); //to generate unique id
}
