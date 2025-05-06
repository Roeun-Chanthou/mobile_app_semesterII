// import 'package:flutter_2/models/product_model.dart';
import 'package:flutter_2/models/product_model.dart';
import 'package:flutter_2/services/api_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;
  var productCategories = <String>[].obs;
  var isLoadingCategories = true.obs;
  var isLoadingProducts = true.obs;
  var selectedCategory = ''.obs;
  var selectedCategoryIndex = RxInt(-1);
  var error = ''.obs;

  List<ProductModel> _allProducts = [];

  @override
  void onInit() {
    super.onInit();
    fetchProductCategories();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoadingProducts(true);
      error('');
      final result = await ApiService.getProducts();
      _allProducts = result;
      products.assignAll(result);
    } catch (e) {
      error(e.toString());
    } finally {
      isLoadingProducts(false);
    }
  }

  void filterProductsByCategory(String category) {
    if (category.isEmpty) {
      products.assignAll(_allProducts);
    } else {
      final filtered = _allProducts
          .where((product) =>
              product.category.toLowerCase() == category.toLowerCase())
          .toList();
      products.assignAll(filtered);
    }
  }

  Future<void> fetchProductCategories() async {
    try {
      isLoadingCategories(true);
      error('');
      final result = await ApiService.getProductCategories();
      productCategories.assignAll(result);
    } catch (e) {
      error(e.toString());
    } finally {
      isLoadingCategories(false);
    }
  }

  Future<void> refreshProducts() async {
    isLoadingProducts(true);
    isLoadingCategories(true);

    try {
      await Future.wait([
        fetchProductCategories(),
        fetchProducts(),
      ]);

      if (selectedCategory.value.isNotEmpty) {
        filterProductsByCategory(selectedCategory.value);
      }
    } catch (e) {
      error('Failed to refresh: ${e.toString()}');
    }
  }

  void resetCategoryFilter() {
    selectedCategory.value = '';
    selectedCategoryIndex.value = -1;
    products.assignAll(_allProducts);
  }
}
