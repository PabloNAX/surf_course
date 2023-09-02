/// Задание — Фильтруй товар
///
final articles = '''
 1,хлеб,Бородинский,500,5
 2,хлеб,Белый,200,15
 3,молоко,Полосатый кот,50,53
 4,молоко,Коровка,50,53
 5,вода,Апельсин,25,100
 6,вода,Бородинский,500,5
 ''';

// Convert(map) String into Product model
List<Product> convertStringToProduct(String articles) {
  List<Product> prodList = [];
  List<String> articleList = articles.trim().split('\n');
  articleList.forEach((e) {
    var line = e.split(',');
    // print(line);
    var prod = Product(
      int.parse(line[0].trim()),
      line[1],
      line[2],
      int.parse(line[3]),
      int.parse(line[4]),
    );
    prodList.add(prod);
  });
  return prodList;
}

// Interface for Filter
abstract class Filter {
  bool apply(Product product) {
    throw UnimplementedError();
  }
}

// Custom Filter for category
class CategoryFilter implements Filter {
  final String category;
  CategoryFilter(this.category);

  @override
  bool apply(Product product) {
    return product.category == this.category ? true : false;
  }
}

// Product DataModel
class Product {
  final int id;
  final String category;
  final String title;
  final int price;
  final int count;

  Product(this.id, this.category, this.title, this.price, this.count);

  @override
  String toString() {
    return "${id.toString()} ${category} ${title} ${price.toString()} рублей ${count} шт";
  }
}

/// Apply filter funciton for proccessing
List<Product> applyFilter(List<Product> products, Filter filter) {
  List<Product> filteredProducts = [];
  products.forEach((element) {
    if (filter.apply(element)) filteredProducts.add(element);
  });
  return filteredProducts;
}

/// Main funciton
void main(List<String> args) {
  List<Product> proccessedProducList = convertStringToProduct(articles);
  var result = applyFilter(proccessedProducList, CategoryFilter('вода'));
  print(result);
}
