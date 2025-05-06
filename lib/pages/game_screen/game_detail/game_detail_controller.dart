import 'package:get/get.dart';

class GameDetailController extends GetxController {
  var isLoading = true.obs;
  var error = ''.obs;

  @override
  void onInit() {
    fetchGameDetail();
    super.onInit();
  }

  void fetchGameDetail() async {
    try {
      isLoading(true);
      error('');
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> refreshGameDetail() async {
    fetchGameDetail();
  }
}
