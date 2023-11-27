import 'package:flutter/material.dart';

import 'package:flutter_application_3/data/workdata.dart';

import 'package:provider/provider.dart';

import 'models/workoutpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final newWorkoutNameController = TextEditingController();
  void createNewWorkout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("create new workout"),
        content: TextField(
          obscureText: false,
          controller: newWorkoutNameController,
          decoration: const InputDecoration(
              hintText: "Workout name", prefixIcon: Icon(Icons.fitness_center)),
        ),
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

  void goToWorkoutPage(String workoutname) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WorkoutPage(
            workoutname: workoutname,
          ),
        ));
  }

  void save() {
    String newWorkoutConroller = newWorkoutNameController.text;
    Provider.of<WorkData>(context, listen: false)
        .addWorkOut(newWorkoutConroller);
    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    newWorkoutNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkData>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: Colors.black,
            floatingActionButton: FloatingActionButton(
              onPressed: createNewWorkout,
              backgroundColor: Colors.red,
              focusColor: Colors.white,
              child: const Icon(Icons.add),
            ),
            body: ListView(children: [
              Image.asset(
                "images/1.jpg",
                fit: BoxFit.cover,
              ),
              ListView.builder(
                padding: const EdgeInsets.all(30),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    value.getworkList()[index].name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: IconButton(
                      onPressed: () =>
                          goToWorkoutPage(value.getworkList()[index].name),
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )),
                ),
                itemCount: value.getworkList().length,
              ),
            ])));
  }
}
