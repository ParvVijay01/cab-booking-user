import 'package:cab_booking_customer/assistants/request_assistant.dart';
import 'package:cab_booking_customer/global/global.dart';
import 'package:cab_booking_customer/infoHandeler/app_info.dart';
import 'package:cab_booking_customer/models/directions.dart';
import 'package:cab_booking_customer/models/user_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class AssistantMethods {
  static Future<String> searchAddressForGeographicCoordinates(
    Position position,
    context,
  ) async {
    String apiUrl =
        "https://us1.locationiq.com/v1/reverse?key=pk.593c04a0352759db92f543feae1b6598&lat=${position.latitude}&lon=${position.longitude}&format=json";

    String humanReadableAddress = "";

    var requestResponse = await RequestAssistant.receiveRequest(apiUrl);
    if (requestResponse != "Error occured, failed. No Response") {
      humanReadableAddress = requestResponse["display_name"];

      Directions userPickUpAddress = Directions();
      userPickUpAddress.locationLatitude = position.latitude;
      userPickUpAddress.locationLongitude = position.longitude;
      userPickUpAddress.locationName = humanReadableAddress;

      Provider.of<AppInfo>(context, listen: false)
          .updatePickUpLocationAddress(userPickUpAddress);
    }

    return humanReadableAddress;
  }

  static void readCurrentOnlineUserInfo() async {
    currentFirebaseUser = fAuth.currentUser;

    DatabaseReference userRef = FirebaseDatabase.instance
        .ref()
        .child("users")
        .child(currentFirebaseUser!.uid);

    userRef.once().then((snap) {
      if (snap.snapshot.value != null) {
        userModelCurrentInfo = UserModel.fromSnapshot(snap.snapshot);
      }
    });
  }
}
