
import 'package:allworkpro/constants/string_contants.dart';
import 'package:allworkpro/constants/theme.dart';
import 'package:allworkpro/presentation/router/routes.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          const SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image(
              image: AssetImage(gigWorkersImage),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[Color(0xfffb623f), Color(0x00fb623f)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    appName,
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Container(
                    width: 180,
                    height: 5,
                    color: themeData.primaryColor,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    appWelcome,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 40),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(onboardingPagesRoute);
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: whiteColor, width: 1.5),
                    ),
                    child: const Text(
                      proceed,
                      style: TextStyle(color: whiteColor, fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
