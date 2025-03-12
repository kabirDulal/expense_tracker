import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final Expense expense;
  @override
  Widget build(context) {
    return Card(
      color: const Color.fromARGB(255, 249, 218, 126),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      categoryIcons[expense.category],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      expense.formattedDate,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
