import 'package:uuid/uuid.dart'; //generates unique ID


class Expense {
  final String title;
  final double amount;
  final DateTime date;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
