import 'package:uuid/uuid.dart'; //generates unique ID

const uuid =  Uuid();

class Expense {
  final String title;
  final double amount;
  final DateTime date;
  final String id;

  Expense({required this.title, required this.amount, required this.date})
    : id = uuid.v4(); //to generate unique id
}
