 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixify_app/model/firebase/notifications_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {

  List<NotificationsModel> allNotifications = [];

  Future<void> fetchAllNotifications() async {
    allNotifications = [];

    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('notification').get();

      if (snapshot.docs.isNotEmpty) {
        for (var notifications in snapshot.docs) {
          allNotifications.add(NotificationsModel.fromSnap(notifications));
        }
      }

      update();

      update();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}