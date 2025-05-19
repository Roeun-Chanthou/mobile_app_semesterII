import 'package:flutter_2/models/user_model2.dart';
import 'package:flutter_2/services/user_service.dart';
import 'package:flutter_2/utils/app_status.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  var user = <UserModel2>[].obs;
  var status = Status.loading.obs;
  var message = ''.obs;
  var padding = 16.0.obs;

  var currentPage = 0.obs;
  var perPage = 10.obs;
  var hasMoreData = true.obs;
  var isLoadingMore = false.obs;

  @override
  void onInit() {
    loadDataUser();
    super.onInit();
  }

  void loadDataUser() async {
    status.value = Status.loading;
    try {
      final result = await UserService.getUserData(
          page: currentPage.value, perPage: perPage.value);

      if (result.isEmpty) {
        hasMoreData.value = false;
      } else {
        user.assignAll(result);
        status.value = Status.success;
      }
    } catch (e) {
      status.value = Status.error;
      message.value = e.toString();
    }
  }

  void loadMoreData() async {
    if (isLoadingMore.value || !hasMoreData.value) return;

    isLoadingMore.value = true;
    try {
      currentPage.value++;
      final result = await UserService.getUserData(
          page: currentPage.value, perPage: perPage.value);

      if (result.isEmpty) {
        hasMoreData.value = false;
      } else {
        user.addAll(result);
      }
    } catch (e) {
      message.value = e.toString();
    } finally {
      isLoadingMore.value = false;
    }
  }

  Future refreshData() async {
    currentPage.value = 0;
    hasMoreData.value = true;
    status.value = Status.loading;
    try {
      final result = await UserService.getUserData(
          page: currentPage.value, perPage: perPage.value);

      if (result.isEmpty) {
        hasMoreData.value = false;
      } else {
        user.assignAll(result);
        status.value = Status.success;
      }
    } catch (e) {
      status.value = Status.error;
      message.value = e.toString();
    }
  }
}
