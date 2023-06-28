import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.height; //783
  static double screenWidth = Get.width; //392

  static double height10 = screenHeight / 78.3;
  static double height20 = screenHeight / 39.15;
  static double width10 = screenWidth / 39.2;

  static double authLogoSize = screenHeight / 5.22;

  static double profileImageSize = screenHeight / 11.18;

  //Auth Page
  static double authBodyHeight350 = screenHeight / 2.24;
  static double authBodyHeight375 = screenHeight / 2.09;
  static double authBodyHeight425 = screenHeight / 1.84;
  static double authBodyWidth = screenWidth * 0.75;

  //Fonts
  static double font12 = screenHeight / 65.25;
  static double font14 = screenHeight / 55.93;
  static double font16 = screenHeight / 48.94;
  static double font30 = screenHeight / 26.1;

  //Radius
  static double radius4 = screenHeight / 192.75;
  static double radius20 = screenHeight / 39.15;
  static double iconButtonRadius = screenHeight / 62.54;

  //Padding
  static double padding5 = screenHeight / 156.6;
  static double padding10 = screenHeight / 78.3;

  //Icon
  static double icon20 = screenHeight / 39.15;
  static double icon15 = screenHeight / 52.2;


  //Splash Screen
  static double splashScreenLogoSize200 = screenHeight / 3.9;
  static double loadingSize16 = screenHeight / 48.94;
}
