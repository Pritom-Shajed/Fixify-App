import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class TechnicianProfilePreviewCard extends StatelessWidget {
  final List<Widget> children;
  const TechnicianProfilePreviewCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.padding15,
          vertical: Dimensions.padding15 * 1.4),
      margin: EdgeInsets.only(bottom: Dimensions.margin15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius4 * 2),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 3,
                offset: const Offset(0, 0),
                color: AppColors.shadowColor),
            BoxShadow(
                blurRadius: 5,
                offset: const Offset(0, 5),
                color: AppColors.shadowColor),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}