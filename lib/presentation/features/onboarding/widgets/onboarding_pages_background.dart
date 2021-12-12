import 'package:allworkpro/constants/theme.dart';
import 'package:flutter/material.dart';

class OnboardingPagesBackground extends StatelessWidget {
  const OnboardingPagesBackground(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Color(0xfff43f56), Color(0xfff45441)],
        ),
      ),
      padding: const EdgeInsets.only(top: 70),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30,
            color: whiteOpacity,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
