import 'package:flutter/material.dart';
import 'package:weatherapp/models/on_boarding_model.dart';

class BoardingWidget extends StatelessWidget {
  final BoardingContent content;

  const BoardingWidget({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 90.0, left: 25),
            child: Image.asset(
              content.imagePath,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 100),
          Text(
            content.mainText,
            style: const TextStyle(
              color: Colors.amber,
              fontSize: 28,
              fontFamily: 'Zilla Slab',
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 40),
            child: Text(
              content.subtitle1,
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 254),
                fontSize: 22,
                fontFamily: 'Zilla Slab',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15),
            child: Text(
              content.subtitle2,
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 254),
                fontSize: 22,
                fontFamily: 'Zilla Slab',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
