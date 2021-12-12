import 'package:allworkpro/business_logic/data_handlers/models/address.dart';
import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  Address? userLocation;

  void updateUserLocation(Address userAddress) {
    userLocation = userAddress;
    notifyListeners();
  }
}
