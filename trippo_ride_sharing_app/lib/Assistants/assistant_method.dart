import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:trippo_ride_sharing_app/global/global.dart';
import 'package:trippo_ride_sharing_app/models/user_model.dart';

class AssistantMethods {
  static void readCurrentOnlineUserInfo() async {
    currentUser = firebaseAuth.currentUser;

    DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child('users').child(currentUser!.uid);

    userRef.once().then((snap) {
      if (snap.snapshot.value != null) {
        userModelCurrentInfo = UserModel.fromSnapShot(snap.snapshot);
      }
    });
  }

  static Future<String> searchAddressForGeographicCoOrdinates(
      Position position, context) async {
    // String apiUrl =
    //     "http://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";
    //
    String humanReadableAddress = "";
    //
    // var requestResponse = await RequestAssistant.receiveRequest(apiUrl);
    //
    // if (requestResponse != "Failed.No Response") {
    //   humanReadableAddress = requestResponse["results"][0]["formatted_address"];
    //
    //   Directions userPickupAddress = Directions();
    //
    //   userPickupAddress.locationLatitude = position.latitude;
    //   userPickupAddress.locationLongitude = position.longitude;
    //   userPickupAddress.locationName = humanReadableAddress;
    // }

    // final coordinates = new Coordinates(lat_data, lon_data);
    // var address =
    //     await Geocoder.local.findAddressesFromCoordinates(coordinates);
    // var first = address.first;
    //
    // // on below line we have set the address to string
    // setState(() {
    //   stAddress = first.addressLine.toString();
    // });
    return humanReadableAddress;
  }
}
