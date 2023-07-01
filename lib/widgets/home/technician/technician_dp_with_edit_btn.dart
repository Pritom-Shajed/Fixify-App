import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class TechnicianDpWithEditBtn extends StatelessWidget {
  final ImageProvider imageProvider;
  final VoidCallback onTapEdit;
  const TechnicianDpWithEditBtn({Key? key, required this.imageProvider, required this.onTapEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius:
          Dimensions.technicianViewProfileDpRadius,
          backgroundImage: imageProvider,
        ),
        Positioned(
            bottom: 0,
            right: 10,
            child: GestureDetector(
              onTap: onTapEdit,
              child: CircleAvatar(
                radius: Dimensions.technicianDpEditBtnSize,
                backgroundColor: AppColors.primaryColor,
                child: Icon(
                  Icons.edit,
                  size: Dimensions.technicianDpEditBtnSize,
                  color: AppColors.whiteColor,
                ),
              ),
            ))
      ],
    );
  }
}
