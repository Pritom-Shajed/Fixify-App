import 'package:get/get.dart';

class AuthController extends GetxController {
  final _obscureTextSignIn = true.obs;
  final _obscureTextSignUp = true.obs;

  final _authSignUpError = false.obs;
  final _authSignInError = false.obs;

  get obscureTextSignIn => _obscureTextSignIn.value;

  get obscureTextSignUp => _obscureTextSignUp.value;

  get authSignUpError => _authSignUpError.value;
  get authSignInError => _authSignInError.value;

  set obscureTextSignIn(value) {
    _obscureTextSignIn.value = value;
  }

  set obscureTextSignUp(value) {
    _obscureTextSignUp.value = value;
  }

  set authSignUpError(value){
    _authSignUpError.value = value;
  }

  set authSignInError(value){
    _authSignInError.value = value;
  }

  changeObscureTextSignIn() {
    obscureTextSignIn = !obscureTextSignIn;
    update();
  }

  changeObscureTextSignUp() {
    obscureTextSignUp = !obscureTextSignUp;
    update();
  }

  authSignUpErrorOccured() {
    authSignUpError = true;
    update();
  }

  authSignUpErrorCleared() {
    authSignUpError = false;
    update();
  }

  authSignInErrorOccured() {
    authSignInError = true;
    update();
  }

  authSignInErrorCleared() {
    authSignInError = false;
    update();
  }
}
