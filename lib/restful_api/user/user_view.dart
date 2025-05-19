import 'package:flutter/material.dart';
import 'package:flutter_2/models/user_model2.dart';
import 'package:flutter_2/restful_api/user/user_controller.dart';
import 'package:flutter_2/routes/routes_name.dart';
import 'package:flutter_2/utils/app_status.dart';
import 'package:get/get.dart';

class UsersView extends GetView<UsersController> {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text("List User"),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(RoutesName.newuser),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.status.value == Status.error) {
          return Center(
            child: Text("Error Network"),
          );
        }

        if (controller.status.value == Status.loading &&
            controller.user.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refreshData,
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent &&
                  !controller.isLoadingMore.value &&
                  controller.hasMoreData.value) {
                controller.loadMoreData();
              }
              return true;
            },
            child: _buildListUser(),
          ),
        );
      }),
    );
  }

  Widget _buildListUser() {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 16,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount:
          controller.user.length + (controller.hasMoreData.value ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= controller.user.length) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        var item = controller.user[index];
        return _buildCardUser(item);
      },
    );
  }

  Widget _buildCardUser(UserModel2 item) {
    var name = "${item.firstName} ${item.lastName}";
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            ClipOval(
              child: Image.network(
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey.shade300,
                ),
                item.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(name),
            ),
          ],
        ),
      ),
    );
  }
}
