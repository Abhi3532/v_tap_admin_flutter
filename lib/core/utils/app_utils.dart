import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  static void showToaster(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static bool isEmailValid(String value) {
    return value.contains(RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"));
  }
}
