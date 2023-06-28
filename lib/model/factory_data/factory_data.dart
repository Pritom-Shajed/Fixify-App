import 'package:fixify_app/model/days_model.dart';
import 'package:fixify_app/model/division_model.dart';
import 'package:fixify_app/model/services_model.dart';

class FactoryData {
  static List<ServicesModel> services = [
    ServicesModel(id: 1, name: 'Fridge'),
    ServicesModel(id: 2, name: 'AC'),
    ServicesModel(id: 3, name: 'Fan'),
    ServicesModel(id: 4, name: 'Fridge'),
    ServicesModel(id: 5, name: 'AC'),
    ServicesModel(id: 6, name: 'Fan'),
    ServicesModel(id: 7, name: 'Fridge'),
    ServicesModel(id: 8, name: 'AC'),
    ServicesModel(id: 9, name: 'Fan'),
  ];

  static List<DaysModel> days = [
    DaysModel(id: 1, day: 'Sun'),
    DaysModel(id: 2, day: 'Mon'),
    DaysModel(id: 3, day: 'Tues'),
    DaysModel(id: 4, day: 'Wed'),
    DaysModel(id: 5, day: 'Thurs'),
    DaysModel(id: 6, day: 'Fri'),
    DaysModel(id: 7, day: 'Sat'),
  ];

  static List<DivisionModel> divisions = [
    DivisionModel(id: 1, divisionName: 'Dhaka'),
    DivisionModel(id: 2, divisionName: 'Chattogram'),
    DivisionModel(id: 3, divisionName: 'Barishal'),
    DivisionModel(id: 4, divisionName: 'Khulna'),
    DivisionModel(id: 5, divisionName: 'Mymensingh'),
    DivisionModel(id: 6, divisionName: 'Rajshahi'),
    DivisionModel(id: 7, divisionName: 'Sylhet'),
    DivisionModel(id: 8, divisionName: 'Rangpur'),

  ];

}