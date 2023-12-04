import 'package:connectivity_plus/connectivity_plus.dart';

class AppCommonFunctions {
  // to check is location allowed or not
  // static Future<bool> isLocationAllowed() async {
  //   LocationPermission permission;
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.whileInUse ||
  //       permission == LocationPermission.always) {
  //     return true;
  //   }
  //   if (permission == LocationPermission.unableToDetermine ||
  //       permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.whileInUse ||
  //         permission == LocationPermission.always) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  // to check interner connectivity
  static Future<bool> checkInternetAvailability() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  //  to use  launch URL
  // static Future<void> launchURL(String link) async {
  //   try {
  //     final Uri url = Uri.parse(link);
  //     await launchUrl(url, mode: LaunchMode.externalApplication);
  //   } catch (_) {
  //     AppDialogBoxes.showPopup(
  //       "Can't launch URL: $link. Please try again later !!",
  //     );
  //   }
  // }
}
