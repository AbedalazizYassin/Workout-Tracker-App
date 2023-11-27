class Exercise {
  final String name;
  final String weight;
  final String reps;
  final String sets;
  bool isComoleted;
  Exercise(
      {required this.name,
      required this.weight,
      required this.reps,
      required this.sets,
      this.isComoleted = false});
}
