import 'package:flutter_2/models/user_model.dart';
import 'package:flutter_2/services/api_service.dart';
import 'package:get/get.dart';
class UserController extends GetxController{

  var user = <UserModel>[].obs;
  var isLoading = true.obs;
  var error = ''.obs;
  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }
  void fetchUsers() async {
    try {
      isLoading(true);
      error('');
      final result = await ApiService.getUsers();
      user.assignAll(result);
    } catch (e) { 
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }
  Future<void> refreshUsers() async {
    fetchUsers();
  }

}