import 'package:get/get.dart';

class AuthController extends GetxController{
  final _obscureText = true.obs;

  get obscureText => _obscureText.value;

  set obscureText(value) {
    _obscureText.value = value;
  }

  changeObscureText(bool value) {
    obscureText = value;
  }
}