import 'package:flutter/material.dart';
import 'package:flutter_application_3/data/workdata.dart';

import 'package:flutter_application_3/models/welcome_screan.dart';

import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Welcome(),
      ),
    );
  }
}
