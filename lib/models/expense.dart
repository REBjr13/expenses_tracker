// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uuid/uuid.dart'; //generates unique ID

const uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work,
} //creates a custom type "predefined allowed values"

class Expense {
  final String title;
  final double amount;
  final DateTime date;
  final String id;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.id,
    required this.category,
  });
    : id = uuid.v4(); //to generate unique id
}
