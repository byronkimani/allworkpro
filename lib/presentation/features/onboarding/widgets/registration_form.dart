import 'package:allworkpro/business_logic/helpers.dart';
import 'package:allworkpro/constants/string_contants.dart';
import 'package:allworkpro/constants/theme.dart';
import 'package:allworkpro/infrastructure/api_calls.dart';
import 'package:allworkpro/presentation/router/routes.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm();

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? name;
  String? phoneNumber;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
            // name
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: inputDecoration.copyWith(labelText: 'Name'),
              style: const TextStyle(fontSize: 14),
              validator: (String? name) => validateName(name.toString().trim()),
              onSaved: (String? value) => name = value.toString().trim(),
            ),
            // email
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: inputDecoration.copyWith(labelText: 'Email'),
              style: const TextStyle(fontSize: 14),
              validator: (String? email) =>
                  validateEmail(email.toString().trim()),
              onSaved: (String? value) => email = value.toString().trim(),
            ),
            // phone number
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: inputDecoration.copyWith(labelText: 'Phone Number'),
              style: const TextStyle(fontSize: 14),
              validator: (String? number) =>
                  validatePhoneNumber(number.toString().trim()),
              onSaved: (String? value) => phoneNumber = value.toString().trim(),
            ),
            // password
            TextFormField(
              obscureText: true,
              decoration: inputDecoration.copyWith(labelText: 'Password'),
              style: const TextStyle(fontSize: 14),
              validator: (String? value) {
                password = value;
                return validatePassword(value.toString().trim());
              },
              onSaved: (String? value) => password = value.toString().trim(),
            ),
            // confirm pass
            TextFormField(
              obscureText: true,
              decoration:
                  inputDecoration.copyWith(labelText: 'Confrim Password'),
              style: const TextStyle(fontSize: 14),
              validator: (String? val) =>
                  validateConfirmPassword(val.toString().trim(), password),
            ),
            const SizedBox(height: 30),
            // create account button
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  await registerNewUser(
                    context: context,
                    phoneNumber: phoneNumber!,
                    name: name!,
                    email: email!,
                    password: password!,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.15,
                  vertical: 15,
                ),
              ),
              child: const Text(
                createAccount,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(alreadyHaveAnAccount),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(loginPageRoute);
                  },
                  child: const Text(
                    signInHere,
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
