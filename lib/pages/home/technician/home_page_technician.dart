import 'package:fixify_app/controller/signout/signout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageTechnician extends StatefulWidget {
  const HomePageTechnician({Key? key}) : super(key: key);

  @override
  State<HomePageTechnician> createState() => _HomePageTechnicianState();
}

class _HomePageTechnicianState extends State<HomePageTechnician> {
  final signOutController = Get.find<SignOutController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Technician'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          SignOutController.signOut(context);
        }, child: Text('Sing out')),
      ),
    );
  }
}
