import 'package:flutter/material.dart';

class ReverseMealPlan extends StatefulWidget {
  const ReverseMealPlan({super.key});

  @override
  State<ReverseMealPlan> createState() => _ReverseMealPlanPageState();
}

class _ReverseMealPlanPageState extends State<ReverseMealPlan> {
  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  final List<String?> columnHeaders = [
    null,
    'Meal',
    'Snack',
    'Meal',
    'Snack',
    'Meal',
  ];

  late List<List<TextEditingController>> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      6,
      (row) => List.generate(7, (col) => TextEditingController()),
    );
  }

  @override
  void dispose() {
    for (var row in _controllers) {
      for (var controller in row) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  Widget _buildCell(int row, int col) {
    // First column: Day label (non-editable)
    if (col == 0 && row >= 0) {
      return Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        color: Colors.grey[200],
        child: Text(
          days[row],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }

    // Header row (non-editable)
    if (row == -1) {
      return Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        color: Colors.blueGrey[100],
        child: Text(
          columnHeaders[col] ?? '',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }

    // Editable cells
    return Padding(
      padding: const EdgeInsets.all(4),
      child: SizedBox(
        width: 100, // You can adjust this width as needed
        child: TextField(
          controller: _controllers[row][col],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            isDense: true,
            contentPadding: EdgeInsets.all(8),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reverse Meal Plan')),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              //Header row
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  6,
                  (col) =>
                      Flexible(fit: FlexFit.loose, child: _buildCell(-1, col)),
                ),
              ),
              const Divider(),
              // Meal Plan rows
              ...List.generate(
                7,
                (row) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    7,
                    (col) => Flexible(
                      fit: FlexFit.loose,
                      child: _buildCell(row, col),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
