import 'package:get/get.dart';

class AuthSignInController extends GetxController {
  final _obscureTextSignIn = true.obs;

  final _authSignInError = false.obs;

  get obscureTextSignIn => _obscureTextSignIn.value;


  get authSignInError => _authSignInError.value;

  set obscureTextSignIn(value) {
    _obscureTextSignIn.value = value;
  }



  set authSignInError(value){
    _authSignInError.value = value;
  }


  changeObscureTextSignIn() {
    obscureTextSignIn = !obscureTextSignIn;
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
