import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weatherapp/Screens/Home_View.dart';
import 'package:weatherapp/Widgets/OnBoarding_widget.dart';
import 'package:weatherapp/models/on_boarding_model.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final List<BoardingContent> contents = [
    BoardingContent(
      imagePath: 'Assets/images/Animation2.gif',
      mainText: 'World between your hands',
      subtitle1:
          'Now you can identify weather conditions anywhere and anytime.',
      subtitle2: 'With high efficiency and no errors',
    ),
    BoardingContent(
      imagePath: 'Assets/images/Animation4.gif',
      mainText: 'check the days ahead',
      subtitle1: 'See the forecast of the next days',
      subtitle2: 'and prepare for it early',
    ),
  ];

  int currentIndex = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: contents.length,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Center(child: BoardingWidget(content: contents[index]));
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 675.0),
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (index) => buildDot(index, context),
                    ),
                  ),
                  if (currentIndex ==
                      contents.length -
                          1) // Only show the button on the last page
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeView(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber, // Button color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Zilla Slab',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: currentIndex == index ? 20 : 10,
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
