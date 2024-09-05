import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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
          padding: const EdgeInsets.only(top: 190.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Image.asset('Assets/images/Animation5.gif'),
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                'No data for display',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Roboto Condensed',
                    color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                'You should to choose the city first.',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto Condensed',
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
