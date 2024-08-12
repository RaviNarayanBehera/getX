import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/counter_controller.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterController counterController = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Counter App',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white),),
      ),
      body: Center(
        child: Obx(
              () => Text(
            "${counterController.count.value}",
            style: const TextStyle(fontSize: 50),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          counterController.increment();
        },
        child: const Icon(Icons.add,color: Colors.white,size: 30,),
      ),
    );
  }
}