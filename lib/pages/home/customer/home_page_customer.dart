import 'package:fixify_app/controller/signout/signout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageCustomer extends StatefulWidget {
  const HomePageCustomer({Key? key}) : super(key: key);

  @override
  State<HomePageCustomer> createState() => _HomePageCustomerState();
}

class _HomePageCustomerState extends State<HomePageCustomer> {
  final signOutController = Get.find<SignOutController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          SignOutController.signOut(context);
        }, child: Text('Sing out')),
      ),
    );
  }
}
