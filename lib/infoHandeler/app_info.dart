import 'package:cab_booking_customer/models/directions.dart';
import 'package:flutter/material.dart';

class AppInfo extends ChangeNotifier {
  Directions? userPickUpLocation;

  void updatePickUpLocationAddress(Directions userPickUpAddress) {
    userPickUpLocation = userPickUpAddress;
    notifyListeners();
  }
}
