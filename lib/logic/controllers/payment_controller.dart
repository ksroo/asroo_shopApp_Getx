import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PayMentController extends GetxController {
//Location
  var latitude = ''.obs;
  var longitude = ''.obs;
  var phoneNumber = ''.obs;
  // var altitude = ''.obs;
  // var speed = ''.obs;
  var address = "Your Address".obs;
  var isLocation = false.obs;
  Future<void> updatePosition() async {
    // isLocation(true);

    Position position = await _determinePosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);


    latitude.value = position.latitude.toString();
    longitude.value = position.longitude.toString();

    Placemark place = placemarks[0];
    //address.value = placemarks[0].toString();
    print(place);
    // address.value =
    //     "${place.street}, ${place.subLocality}, ${place.locality},${place.postalCode}, ${place.country}";
    address.value = "${place.country}, ${place.street},";
    // isLocation(false);
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }


//Google Pay


}
