import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget showCustomLoading ({Color? color}){
 return SpinKitWave(
    color: color ?? AppColors.primaryColor,
    size: Dimensions.loadingSize16,
  );
}
