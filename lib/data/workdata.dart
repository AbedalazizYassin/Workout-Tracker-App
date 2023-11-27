import 'package:flutter/cupertino.dart';

import 'package:flutter_application_3/models/exercise.dart';
import 'package:flutter_application_3/models/work.dart';

class WorkData extends ChangeNotifier {
  List<WorkOut> workList = [
    WorkOut(
      name: "Upper Body",
      exercises: [
        Exercise(name: "Bicep curls", weight: "10", reps: "10", sets: "3")
      ],
    ),
    WorkOut(
      name: "Lower Body",
      exercises: [
        Exercise(name: "Bicep curls", weight: "10", reps: "10", sets: "3")
      ],
    )
  ];

  List<WorkOut> getworkList() {
    return workList;
  }

  int numberOfExerciseInWorkout(String workoutname) {
    WorkOut relevantWorkout = getRelevalentWorkout(workoutname);
    return relevantWorkout.exercises.length;
  }

  void addWorkOut(String name) {
    workList.add(WorkOut(name: name, exercises: []));
    notifyListeners();
    ;
  }

  void addExercise(String workoutname, String exercisename, String weight,
      String reps, String sets) {
    WorkOut relevantWorkOut = getRelevalentWorkout(workoutname);
    relevantWorkOut.exercises.add(
        Exercise(name: exercisename, weight: weight, reps: reps, sets: sets));
    notifyListeners();
  }

  void checKExercise(String workoutname, String exercisename) {
    Exercise relevantExercise = getRelevantExercise(workoutname, exercisename);
    relevantExercise.isComoleted = !relevantExercise.isComoleted;
    notifyListeners();
  }

  WorkOut getRelevalentWorkout(String workoutname) {
    WorkOut relevantWorkout =
        workList.firstWhere((WorkOut) => WorkOut.name == workoutname);
    return relevantWorkout;
  }

  Exercise getRelevantExercise(
    String workoutname,
    String exercisename,
  ) {
    WorkOut relevantWorkout = getRelevalentWorkout(workoutname);
    Exercise relevantExercise = relevantWorkout.exercises
        .firstWhere((exercise) => exercise.name == exercisename);
    return relevantExercise;
  }
}
