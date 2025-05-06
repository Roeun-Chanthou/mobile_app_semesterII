import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2/models/product_model.dart';
import 'package:flutter_2/pages/products/product_controller.dart';
import 'package:get/get.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('PRODUCTS'),
      ),
      body: Obx(() {
        if (controller.isLoadingProducts.value) {
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
                  onPressed: controller.fetchProducts,
                  child: const Text("Retry"),
                ),
              ],
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: controller.refreshProducts,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Obx(
                () => controller.isLoadingCategories.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        height: 50,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.productCategories.length,
                          itemBuilder: (context, index) {
                            final category =
                                controller.productCategories[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Obx(
                                () => ChoiceChip(
                                  label: Text(category),
                                  selected:
                                      controller.selectedCategoryIndex.value ==
                                          index,
                                  onSelected: (selected) {
                                    if (selected) {
                                      controller.selectedCategory.value =
                                          category;
                                      controller.selectedCategoryIndex.value =
                                          index;
                                      controller
                                          .filterProductsByCategory(category);
                                    } else {
                                      controller.selectedCategory.value = '';
                                      controller.selectedCategoryIndex.value =
                                          -1;
                                      controller.filterProductsByCategory('');
                                    }
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ),
              Obx(
                () => GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final product = controller.products[index];
                    return _buildCardItem(product);
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildCardItem(ProductModel product) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: CachedNetworkImage(
                imageUrl: product.image,
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              product.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Text(
              "\$${product.price}",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
