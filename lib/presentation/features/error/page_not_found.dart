import 'package:allworkpro/constants/string_contants.dart';
import 'package:allworkpro/constants/theme.dart';
import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Image(image: AssetImage(errorImage)),
          const SizedBox(height: 30),
          const Text(
            'OOPS! AN ERROR OCCURED',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: accentColor,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: mediaQueryData.size.width * 0.3, vertical: 15)),
            child: const Text(
              'GO BACK',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
