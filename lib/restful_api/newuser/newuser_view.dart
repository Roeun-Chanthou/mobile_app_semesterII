import 'package:flutter/material.dart';
import 'package:flutter_2/restful_api/newuser/newuser_controller.dart';
import 'package:get/get.dart';

class NewUserView extends GetView<NewUserController> {
  const NewUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create User"),
      ),
      body: Column(
        children: [
          TextField(
            
          ),
        ],
      ),
    );
  }
}
