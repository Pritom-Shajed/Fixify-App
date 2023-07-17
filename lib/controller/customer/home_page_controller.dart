import 'package:get/get.dart';

class HomePageController extends GetxController {
  final _tabIndex = 0.obs;


  get tabIndex => _tabIndex.value;

  set tabIndex(value) {
    _tabIndex.value = value;
  }

  updateIndex(int index){
    tabIndex = index;
    update();
  }
}