import 'dart:io';

class CheckInternet{
  static Future<bool> isConnected()async{
      bool isConnected = true;
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      isConnected = true;
    } else {
      isConnected = false;
    }
  } on SocketException catch (_) {
    isConnected = false;
  }
  return isConnected;
  }
}