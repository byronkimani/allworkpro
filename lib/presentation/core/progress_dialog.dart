import 'package:allworkpro/constants/theme.dart';
import 'package:allworkpro/presentation/core/loading_indicator.dart';
import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 200,
        child: Column(
          children: <Widget>[
            Container(
              color: accentColor,
              height: 40,
            ),
            const SizedBox(height: 20),
            Container(
              height: 100,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const LoadingIndicator(),
                  const SizedBox(width: 10),
                  Text(
                    message,
                    style: const TextStyle(color: accentColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
