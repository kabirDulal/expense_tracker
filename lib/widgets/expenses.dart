import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expenses/expense_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
        title: 'Flutter Course',
        amount: 54.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'game',
        amount: 32.54,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'movie',
        amount: 32.54,
        date: DateTime.now(),
        category: Category.leisure),
  ];
  void _addExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const NewExpense());
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(onPressed: _addExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Expanded(
        child: Column(
          children: [
            const Text('Chart Data'),
            ExpensesList(expenses: _registeredExpense),
          ],
        ),
      ),
    );
  }
}
