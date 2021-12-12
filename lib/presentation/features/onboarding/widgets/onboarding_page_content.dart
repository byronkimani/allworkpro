import 'package:allworkpro/constants/theme.dart';
import 'package:allworkpro/presentation/router/routes.dart';
import 'package:flutter/material.dart';

class OnboardingPageContent extends StatelessWidget {
  const OnboardingPageContent({
    required this.indicatorList,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.buttonText,
  });

  final String buttonText;
  final String content;
  final String imagePath;
  final List<Widget> indicatorList;
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 40, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage(imagePath),
            height: 150,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 25, color: primaryColor),
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 25, color: accentColor),
          ),
          Text(
            content,
            style: const TextStyle(fontSize: 20, color: accentColor),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicatorList,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(loginPageRoute);
              },
              child: Text(
                buttonText,
                style: const TextStyle(color: accentColor, fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
