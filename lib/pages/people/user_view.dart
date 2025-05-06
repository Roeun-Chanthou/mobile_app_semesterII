import 'package:flutter/material.dart';
import 'package:flutter_2/models/user_model.dart';
import 'package:flutter_2/pages/people/user_controller.dart';
import 'package:get/get.dart';

class UserView extends GetView<UserController> {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('USERS'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (controller.error.isNotEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error: ${controller.error.value}',
                    ),
                    ElevatedButton(
                      onPressed: controller.fetchUsers,
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: controller.refreshUsers,
              child: ListView.builder(
                itemCount: controller.user.length,
                itemBuilder: (context, index) {
                  final user = controller.user[index];
                  return _buildCardItem(user);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCardItem(UserModel user) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          ListTile(
            title: Text('${user.name.firstname} ${user.name.lastname}'),
            subtitle: Text(user.email),
          ),
        ],
      ),
    );
  }
}
