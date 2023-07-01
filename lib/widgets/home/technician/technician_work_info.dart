import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/home/technician/show_work_info.dart';
import 'package:flutter/material.dart';

class TechnicianWorkInfo extends StatelessWidget {
  final String number1;
  final String number2;
  final String number3;
  final String number4;
  final String title1;
  final String title2;
  final String title3;
  final String title4;
  final String? subtitle4;
  final VoidCallback? onTap1;
  final VoidCallback? onTap2;
  final VoidCallback? onTap3;
  final VoidCallback? onTap4;

  const TechnicianWorkInfo(
      {Key? key,
      required this.number1,
      required this.number2,
      required this.number3,
      required this.number4,
      required this.title1,
      required this.title2,
      required this.title3,
      required this.title4,
      this.subtitle4,
      this.onTap1,
      this.onTap2,
      this.onTap3,
      this.onTap4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              ShowWorkInfo(
                onTap: onTap1,
                number: number1,
                title: title1,
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              ShowWorkInfo(onTap: onTap3, number: number3, title: title3),
            ],
          ),
        ),

        Expanded(
          child: Column(
            children: [
              ShowWorkInfo(onTap: onTap2, number: number2, title: title2),
              SizedBox(
                height: Dimensions.height20,
              ),
              ShowWorkInfo(
                onTap: onTap4,
                number: number4,
                title: title4,
                subtitle: subtitle4,
              ),
            ],
          ),
        )
      ],
    );
  }
}
