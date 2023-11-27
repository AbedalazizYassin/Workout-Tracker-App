import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/exercisetile.dart';
import 'package:flutter_application_3/data/workdata.dart';
import 'package:provider/provider.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({required this.workoutname, super.key});
  final String workoutname;

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

final exerciseNameController = TextEditingController();
final weightController = TextEditingController();
final repController = TextEditingController();
final setController = TextEditingController();

class _WorkoutPageState extends State<WorkoutPage> {
  void onCheckBoxChanged(String workoutname, String exercisename) {
    Provider.of<WorkData>(context, listen: false)
        .checKExercise(workoutname, exercisename);
  }

  void createnewexercise() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Add a new exercise",
          style: TextStyle(color: Color(0xFF444444)),
        ),
        backgroundColor: Colors.grey[20],
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(
            controller: exerciseNameController,
            decoration: const InputDecoration(
              hintText: "Exercise name",
            ),
          ),
          TextField(
            controller: weightController,
            decoration: const InputDecoration(
              hintText: "Weight",
            ),
          ),
          TextField(
            controller: repController,
            decoration: const InputDecoration(
              hintText: "Reps",
            ),
          ),
          TextField(
            controller: setController,
            decoration: const InputDecoration(
              hintText: "Sets",
            ),
          )
        ]),
        actions: [
          MaterialButton(
            onPressed: save,
            child: const Text("Save"),
          ),
          MaterialButton(
            onPressed: cancel,
            child: const Text("Cancel"),
          )
        ],
      ),
    );
  }

  void save() {
    String newExerciseName = exerciseNameController.text;
    String weight = weightController.text;
    String reps = repController.text;
    String sets = setController.text;

    Provider.of<WorkData>(context, listen: false)
        .addExercise(widget.workoutname, newExerciseName, weight, reps, sets);
    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    exerciseNameController.clear();
    weightController.clear();

    repController.clear();
    setController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.workoutname),
          backgroundColor: Colors.black,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createnewexercise,
          backgroundColor: Colors.red,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: value.numberOfExerciseInWorkout(widget.workoutname),
            itemBuilder: (context, index) => ExerciseTile(
                  exerciseName: value
                      .getRelevalentWorkout(widget.workoutname)
                      .exercises[index]
                      .name,
                  weight: value
                      .getRelevalentWorkout(widget.workoutname)
                      .exercises[index]
                      .weight,
                  reps: value
                      .getRelevalentWorkout(widget.workoutname)
                      .exercises[index]
                      .reps,
                  sets: value
                      .getRelevalentWorkout(widget.workoutname)
                      .exercises[index]
                      .sets,
                  isCompleted: value
                      .getRelevalentWorkout(widget.workoutname)
                      .exercises[index]
                      .isComoleted,
                  onCheckBoxChanged: (val) => onCheckBoxChanged(
                    widget.workoutname,
                    value
                        .getRelevalentWorkout(widget.workoutname)
                        .exercises[index]
                        .name,
                  ),
                )),
      ),
    );
  }
}
