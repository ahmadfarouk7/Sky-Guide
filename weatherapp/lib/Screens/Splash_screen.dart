import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weatherapp/Screens/Home_View.dart';
import 'package:weatherapp/Screens/On_Boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 11), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnBoarding()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff1B2445),
              Color(0xff292D5C),
              Color(0xff433A8B),
              Color(0xff5C42A5),
              Color(0xff6A4AAA),
              Color(0xff874EAC),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 180.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'Assets/images/Animation.gif',
                height: 300,
                width: 300,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),
              const Text(
                'Sky',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 58,
                    fontFamily: 'Zilla Slab'),
              ),
              const Text(
                'Guide',
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 60,
                    fontFamily: 'Zilla Slab'),
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                'Be ready for a unique experience',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 22,
                    fontFamily: 'Nerko_One'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
