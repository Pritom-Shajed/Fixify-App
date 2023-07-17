import 'package:fixify_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProfilePageCustomer extends StatelessWidget {
  const ProfilePageCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: const Text('Profile'),
      ),
      body: Container(),
    );
  }
}
