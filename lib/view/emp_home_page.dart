import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/global.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Employee data',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: Obx(
        () {
          return ListView.builder(
            itemCount: employeeController.employeeList.length,
            itemBuilder: (context, index) => Card(
              color: Colors.grey.shade300,
              child: ListTile(
                leading:
                    Text(employeeController.employeeList[index].id.toString()),
                title: Text(employeeController.employeeList[index].name),
                subtitle:
                    Text(employeeController.employeeList[index].designation),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Update details'),
                            actions: [
                              inputDetails(
                                label: 'ID',
                                controller: txtId,
                              ),
                              inputDetails(
                                label: 'Name',
                                controller: txtName,
                              ),
                              inputDetails(
                                label: 'Designation',
                                controller: txtDesignation,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  employeeController.updateEmployeeData(index, {
                                    'id': txtId.text,
                                    'name': txtName.text,
                                    'designation': txtDesignation.text,
                                  });
                                  txtName.clear();
                                  txtId.clear();
                                  txtDesignation.clear();
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        employeeController.deleteEmployeeData(index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Form(
              key: formKey,
              child: AlertDialog(
                title: const Text('Enter details'),
                actions: [
                  inputDetails(
                    label: 'ID',
                    controller: txtId,
                  ),
                  inputDetails(
                    label: 'Name',
                    controller: txtName,
                  ),
                  inputDetails(
                    label: 'Designation',
                    controller: txtDesignation,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          bool response = formKey.currentState!.validate();
                          if (response) {
                            employeeController.addEmployeeData({
                              'id': txtId.text,
                              'name': txtName.text,
                              'designation': txtDesignation.text,
                            });
                            txtName.clear();
                            txtId.clear();
                            txtDesignation.clear();
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
