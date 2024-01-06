import 'package:flutter/material.dart';
import 'package:trippo_ride_sharing_app/models/directions.dart';

class AppInfo extends ChangeNotifier {
  Directions? userPickUpLocation, userDropOffLocation;

  int countTotalTrips = 0;

  // List<String> historyTripsKeysList =[];
  // List<TripsHistoryModel>allTripsHistoryInformationList =[];

  void updatePickUpLocationAddress(Directions userPickUpAddress) {
    userPickUpLocation = userPickUpAddress;
    notifyListeners();
  }

  void updateDropOffLocationAddress(Directions dropOffAddress) {
    userDropOffLocation = dropOffAddress;
    notifyListeners();
  }
}
