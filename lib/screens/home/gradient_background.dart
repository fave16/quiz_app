import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground(this.color1, this.color2, {super.key, this.child});

  const GradientBackground.purple({super.key , this.child})
      : color1 = const Color.fromARGB(255, 142, 45, 226),
        color2 = const Color.fromARGB(255, 16, 1, 48);

  final startAlignment = Alignment.topLeft;
  final endAlignment = Alignment.bottomRight;

  final Color color1;
  final Color color2;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: child,
    );
  }
}
