import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Category { work, leisure, travel, food }

const categoryIcons = {
  Category.work: Icons.work,
  Category.leisure: Icons.movie,
  Category.travel: Icons.airplane_ticket,
  Category.food: Icons.lunch_dining,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String title;
  final double amount;
  final DateTime date;
  final String id;
  final Category category;
  String get formattedDate {
    return formatter.format(date);
  }
}
