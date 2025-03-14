import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final Expense expense;
  @override
  Widget build(context) {
    return Card(
      color: const Color.fromARGB(192, 3, 125, 161),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: const TextStyle(
                  color: Color.fromARGB(255, 2, 46, 56),
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Color.fromARGB(225, 180, 7, 7),
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                  //it will return with just 2 decimal after the integer
                ),
                const Spacer(),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(categoryIcons[expense.category]),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          expense.formattedDate,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
