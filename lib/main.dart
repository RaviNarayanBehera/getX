import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/view/counter_page.dart';
import 'package:getx/view/emp_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // getPages: [GetPage(name: '/', page: () => const CounterPage(),)],
      getPages: [GetPage(name: '/', page: () => const EmployeeScreen(),)],
    );
  }
}
