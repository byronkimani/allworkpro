import 'package:allworkpro/business_logic/data_handlers/app_data.dart';
import 'package:allworkpro/constants/string_contants.dart';
import 'package:allworkpro/constants/theme.dart';
import 'package:allworkpro/presentation/router/app_router.dart';
import 'package:allworkpro/presentation/router/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppData>(
      create: (BuildContext context) => AppData(),
      child: MaterialApp(
        title: appName,
        theme: apptheme,
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? loginPageRoute
            : homePageRoute,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
