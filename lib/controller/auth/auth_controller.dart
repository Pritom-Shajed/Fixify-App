import 'package:get/get.dart';

class AuthController extends GetxController{
  final _obscureTextSignIn = true.obs;
  final _obscureTextCustomerSignUp = true.obs;
  final _obscureTextTechnicianSignUp = true.obs;

  get obscureTextSignIn => _obscureTextSignIn.value;
  get obscureTextCustomerSignUp => _obscureTextCustomerSignUp.value;
  get obscureTextTechnicianSignUp => _obscureTextTechnicianSignUp.value;

  set obscureTextSignIn(value) {
    _obscureTextSignIn.value = value;
  }
  set obscureTextCustomerSignUp(value) {
    _obscureTextSignIn.value = value;
  }
  set obscureTextTechnicianSignUp(value) {
    _obscureTextSignIn.value = value;
  }

  changeObscureTextSignIn(bool value) {
    obscureTextSignIn = value;
  }

  changeObscureTextCustomerSignUp(bool value) {
    obscureTextSignIn = value;
  }

  changeObscureTextTechnicianSignUp(bool value) {
    obscureTextSignIn = value;
  }
}