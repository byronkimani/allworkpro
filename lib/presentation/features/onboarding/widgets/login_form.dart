import 'package:allworkpro/business_logic/helpers.dart';
import 'package:allworkpro/constants/string_contants.dart';
import 'package:allworkpro/constants/theme.dart';
import 'package:allworkpro/infrastructure/api_calls.dart';
import 'package:allworkpro/presentation/router/routes.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm();

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            // email
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: inputDecoration.copyWith(labelText: 'Email'),
              style: const TextStyle(fontSize: 14),
              validator: (String? email) =>
                  validateEmail(email.toString().trim()),
              onSaved: (String? value) => email = value.toString().trim(),
            ),
            // password
            const SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              decoration: inputDecoration.copyWith(labelText: 'Password'),
              style: const TextStyle(fontSize: 14),
              validator: (String? pass) =>
                  validatePassword(pass.toString().trim()),
              onSaved: (String? value) => password = value.toString().trim(),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  await signInWithEmailAndPass(
                    context: context,
                    email: email!,
                    password: password!,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: mediaQuery.size.width * 0.3, vertical: 15),
              ),
              child: const Text(
                login,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(doNotHaveAnAccount),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(createAccountPageRoute);
                  },
                  child: const Text(
                    registerHere,
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
