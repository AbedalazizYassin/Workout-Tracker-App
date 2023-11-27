import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExerciseTile extends StatelessWidget {
  ExerciseTile(
      {super.key,
      required this.exerciseName,
      required this.reps,
      required this.sets,
      required this.isCompleted,
      required this.weight,
      required this.onCheckBoxChanged});
  final String exerciseName;
  final String weight;
  final String reps;
  final String sets;

  final bool isCompleted;
  void Function(bool?)? onCheckBoxChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListTile(
        title: Text(exerciseName),
        subtitle: Row(
          children: [
            Chip(label: Text(weight + "Kg")),
            const SizedBox(
              width: 3,
            ),
            Chip(label: Text(reps + "reps")),
            const SizedBox(
              width: 3,
            ),
            Chip(label: Text(sets + " sets"))
          ],
        ),
        trailing: Checkbox(
            value: isCompleted,
            onChanged: (value) => onCheckBoxChanged!(value)),
      ),
    );
  }
}
