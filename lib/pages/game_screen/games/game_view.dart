import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2/models/game_model.dart';
import 'package:flutter_2/pages/game_screen/games/game_controller.dart';
import 'package:flutter_2/routes/routes_name.dart';
import 'package:get/get.dart';

class GameView extends GetView<GameController> {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('GAMES'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.error.value.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${controller.error.value}',
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: controller.fetchGames,
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: controller.refreshGames,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 16),
              itemCount: controller.game.length,
              itemBuilder: (context, index) {
                final game = controller.game[index];
                return _buildCardItem(game);
              },
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCardItem(GameModel game) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          RoutesName.gameDetailScreen,
          arguments: game,
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (game.image.isNotEmpty)
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: CachedNetworkImage(
                  imageUrl: game.image,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    size: 50,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                game.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                game.description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Worth: ${game.worth}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
