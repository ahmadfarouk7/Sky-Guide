import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title1;
  final String? title2;
  final List<Color> gradientColors;
  final List<Widget>? actions;

  const GradientAppBar({
    super.key,
    required this.title1,
    this.title2,
    required this.gradientColors,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff874EAC).withOpacity(0.3), // White shadow
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 2), // Shadow position
            ),
          ],
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            Text(
              title1,
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 26,
                  fontFamily: 'Zilla Slab'),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title2!,
              style: const TextStyle(
                  color: Colors.amber, fontSize: 25, fontFamily: 'Zilla Slab'),
            ),
          ],
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
