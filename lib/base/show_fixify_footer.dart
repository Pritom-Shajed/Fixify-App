import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

Widget showFixifyFooter (){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: Dimensions.footerLogoSize,
        child: Image.asset('assets/icons/fixify_logo.png'),
      ),
      const SmallText(
          text: 'Simplifying Technician Selection')
    ],
  );
}