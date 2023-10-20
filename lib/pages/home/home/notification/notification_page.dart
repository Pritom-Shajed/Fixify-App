import 'package:fixify_app/base/show_custom_loader.dart';
import 'package:fixify_app/controller/home/customer_controller.dart';
import 'package:fixify_app/controller/home/notification_controller.dart';
import 'package:fixify_app/controller/technician/technician_controller.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_app/widgets/notification/notification_card.dart';
import 'package:fixify_app/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  final String userId;
  const NotificationPage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:
              CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
          backgroundColor: AppColors.whiteColor,
          title: const Text(
            'Notifications',
            style: TextStyle(letterSpacing: 0),
          ),
        ),
        body: FutureBuilder(
            future: Get.find<NotificationController>().fetchAllNotifications(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return  Center(
                  child: showCustomLoader(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Oops! Something went wrong! please try again'),
                );
              } else {
                return GetBuilder<NotificationController>(builder: (controller){
                  var noti = controller.allNotifications.where((element) => element.customerUid == userId).toList();
                  return ListView.builder(
                      itemCount:  noti.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(Dimensions.padding10),
                          child: NotificationCards.notificationCardCustomer(
                              imageUrl:
                              'https://www.kindpng.com/picc/m/207-2074624_white-gray-circle-avatar-png-transparent-png.png',
                              title: 'Pritom',
                              subtitle: noti[index].description ?? 'null',
                              onTapDelete: () {}),
                        );
                      });
                });
              }
            }));
  }
}
