import 'package:allworkpro/constants/string_contants.dart';
import 'package:fluttertoast/fluttertoast.dart';

String? validateEmail(String? input) {
  if (input != null || input!.isNotEmpty) {
    if (RegExp(emailRegex).hasMatch(input)) {
      return null;
    } else {
      return pleaseInputValidEmail;
    }
  }
  return pleaseInputValidEmail;
}

String? validatePassword(String? input) {
  if (input != null || input!.isNotEmpty) {
    if (input.length >= 6) {
      return null;
    } else {
      return passwordTooShort;
    }
  }
  return passwordTooShort;
}

String? validateConfirmPassword(String? input, String? firstPass) {
  if (validatePassword(input) == null) {
    if (input.toString() == firstPass.toString()) {
      return null;
    }
    return makeSurePasswordsMatch;
  }
  return passwordTooShort;
}

String? validateName(String? input) {
  if (input != null || input!.isNotEmpty) {
    return null;
  } else {
    return pleaseEnterName;
  }
}

String? validateString(String? input) {
  if (input != null || input!.isNotEmpty) {
    return null;
  } else {
    return pleaseEnterField;
  }
}

String? validatePhoneNumber(String? input) {
  if (input != null || input!.isNotEmpty) {
    if (RegExp(phoneRegex).hasMatch(input)) {
      return null;
    } else {
      return pleaseInputValidPhone;
    }
  }
  return pleaseInputValidPhone;
}

String? validateIDNumber(String? input) {
  if (input is! num) {
    if (input!.length > 6) {
      return null;
    } else {
      return pleaseInputIDNumber;
    }
  }
  return pleaseInputIDNumber;
}

void displaytoastMessage({required String message}) {
  Fluttertoast.showToast(
    msg: message,
  );
}
