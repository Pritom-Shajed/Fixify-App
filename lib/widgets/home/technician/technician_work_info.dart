import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/home/technician/show_work_info.dart';
import 'package:flutter/material.dart';

class TechnicianWorkInfo extends StatelessWidget {
  final String number1;
  final String number2;
  final String number3;
  final String title1;
  final String title2;
  final String title3;
  final String? subtitle3;
  final VoidCallback? onTap1;
  final VoidCallback? onTap2;
  final VoidCallback? onTap3;

  const TechnicianWorkInfo(
      {Key? key,
      required this.number1,
      required this.number2,
      required this.number3,
      required this.title1,
      required this.title2,
      required this.title3,
      this.subtitle3,
      this.onTap1,
      this.onTap2,
      this.onTap3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: ShowWorkInfo(onTap: onTap1, number: number1, title: title1)),
          ],
        ),

        SizedBox(height: Dimensions.height10,),
        Row(
          children: [
            Expanded(child: ShowWorkInfo(onTap: onTap2, number: number2, title: title2)),
            SizedBox(width: Dimensions.width10,),
            Expanded(
              child: ShowWorkInfo(
                onTap: onTap3,
                number: number3,
                title: title3,
                subtitle: subtitle3,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
