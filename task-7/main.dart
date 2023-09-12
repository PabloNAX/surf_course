import 'dart:collection';

import 'raw_data.dart';

/// Задание — Магазин "Шестёрочка"
///

typedef Subcategory = Map<String, List<String>>;

void main() {
  List<RawProductItem> products = dataFromBackend;

  Map<String, Subcategory> categories = HashMap();

  var proccessedProducts = products.where((product) =>
      product.qty > 0 && product.expirationDate.isAfter(DateTime(2022)));

  proccessedProducts.forEach((product) {
    // Если нет такой еще категории то добавляем пустой мап
    if (!categories.containsKey(product.categoryName)) {
      categories[product.categoryName] = {};
    }

    // Если нет такой подкатегории то создаем пустую
    if (!categories[product.categoryName]!
        .containsKey(product.subcategoryName)) {
      categories[product.categoryName]![product.subcategoryName] = [];
    }

    // добавляем продукт в категорию и подкатегориб
    categories[product.categoryName]![product.subcategoryName]!
        .add(product.name);
  });

  // print(products);
  // print(proccessedProducts);
  print(categories);
}
