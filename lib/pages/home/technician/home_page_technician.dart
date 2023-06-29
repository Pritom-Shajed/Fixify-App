import 'package:fixify_app/controller/signout/signout_controller.dart';
import 'package:fixify_app/controller/technician/technician_controller.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageTechnician extends StatefulWidget {
  const HomePageTechnician({Key? key}) : super(key: key);

  @override
  State<HomePageTechnician> createState() => _HomePageTechnicianState();
}

class _HomePageTechnicianState extends State<HomePageTechnician> {
  final signOutController = Get.find<SignOutController>();
  final technicianPageController = Get.find<TechnicianPageController>();

  @override
  void initState() {
    technicianPageController.fetchTechnicianUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Technician'),
        ),
        body: GetBuilder<TechnicianPageController>(
          builder: (controller) {
            return controller.userInfoTechnician == null
                ? CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  )
                : Column(
                    children: [
                      Container(
                        height: 300,
                        width: double.maxFinite,
                        margin: EdgeInsets.all(Dimensions.padding10),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.primaryColor,
                                  AppColors.primaryColor,
                                ]),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                  color: AppColors.shadowColor,
                                  offset: const Offset(0, 3))
                            ]),
                        child: Column(
                          children: [
                            SmallText(
                                text: controller.userInfoTechnician!.fullName!),
                            CircleAvatar(
                              radius: 80,
                              child: Image.network(controller.userInfoTechnician!.profilePic!),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                            onPressed: () {
                              SignOutController.signOut(context);
                            },
                            child: Text('Sing out')),
                      ),
                    ],
                  );
          },
        ));
  }
}
