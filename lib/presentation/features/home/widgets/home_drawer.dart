import 'package:allworkpro/constants/string_contants.dart';
import 'package:allworkpro/constants/theme.dart';
import 'package:allworkpro/presentation/router/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 165,
            width: double.infinity,
            child: DrawerHeader(
              decoration: BoxDecoration(color: accentColor.withOpacity(0.95)),
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    height: 65,
                    child: Image(image: AssetImage(userIconImage)),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'John Doe',
                        style: TextStyle(color: whiteColor, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: const <Widget>[
                    Icon(Icons.attach_money),
                    SizedBox(width: 10),
                    Text('Payment'),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: const <Widget>[
                    Icon(Icons.account_circle),
                    SizedBox(width: 10),
                    Text('Account'),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: const <Widget>[
                    Icon(Icons.settings),
                    SizedBox(width: 10),
                    Text('Settings'),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    loginPageRoute, (Route<dynamic> route) => false);
              },
              child: const Text(
                'SIGN OUT',
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
