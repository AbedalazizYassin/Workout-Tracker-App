import 'package:flutter/material.dart';
import 'package:flutter_application_3/home.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/2.png",
            fit: BoxFit.cover,
          ),
          const Text("Track your daily workouts & watch your "),
          const Text("progress!"),
          const SizedBox(
            height: 59,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ));
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 120),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: Colors.grey)),
              child: const Text(
                "Get Started",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
