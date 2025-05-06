import 'package:flutter_2/models/game_model.dart';
import 'package:flutter_2/services/api_service.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  var game = <GameModel>[].obs;
  var isLoading = true.obs;
  var error = ''.obs;
  @override
  void onInit() {
    super.onInit();
    fetchGames();
  }

  void fetchGames() async {
    try {
      isLoading(true);
      error('');
      final result = await ApiService.getGame();
      game.assignAll(result);
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> refreshGames() async {
    fetchGames();
  }

  void clearGames() {
    game.clear();
  }
}
