import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
        backgroundColor: const Color.fromARGB(207, 8, 73, 93),
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    final deletedExpenseTitle = _registeredExpenses[expenseIndex].title;
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 16, 167, 218),
        duration: const Duration(seconds: 5),
        content: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 3, 110, 149),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            "$deletedExpenseTitle is  Deleted",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 1, 24, 29),
            ),
          ),
        ),
        action: SnackBarAction(
          textColor: const Color.fromARGB(255, 1, 16, 29),
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = Center(
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(232, 56, 176, 209),
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Text(
          "There is no Expense currently please enter any expense you have",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 1, 40, 45),
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 156, 181, 189),
      appBar: AppBar(
        shadowColor: const Color.fromARGB(255, 76, 4, 134),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
        title: const Text(
          'Expense Tracker App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 89, 105),
      ),
      body:width < 600 ? Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent,
          ),
        ],
      ): Row(
        children: [          
          Expanded(child: Chart(expenses: _registeredExpenses)),
          Expanded(
            child: mainContent,
          ),        
        ],
      ),
    );
  }
}
