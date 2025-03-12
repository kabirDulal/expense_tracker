import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final Expense expense;
  @override
  Widget build(context) {
    return Card(
      color: const Color.fromARGB(255, 152, 118, 165),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(
              expense.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
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
