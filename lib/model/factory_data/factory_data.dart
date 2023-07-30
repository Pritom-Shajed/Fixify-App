import 'package:fixify_app/model/days_model.dart';

class FactoryData {
  // static List<ServicesModel> services = [
  //   ServicesModel(id: 1, serviceName: 'Fridge'),
  //   ServicesModel(id: 2, serviceName: 'AC'),
  //   ServicesModel(id: 3, serviceName: 'Fan'),
  // ];

  static List<DaysModel> days = [
    DaysModel(id: 1, day: 'Sun'),
    DaysModel(id: 2, day: 'Mon'),
    DaysModel(id: 3, day: 'Tues'),
    DaysModel(id: 4, day: 'Wed'),
    DaysModel(id: 5, day: 'Thurs'),
    DaysModel(id: 6, day: 'Fri'),
    DaysModel(id: 7, day: 'Sat'),
  ];

  static List<String> divisions = [
    'Dhaka',
    'Chattogram',
    'Barishal',
    'Khulna',
    'Mymensingh',
    'Rajshahi',
    'Sylhet',
    'Rangpur'
  ];
}
