part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductCategory> categories;
  final List<Product> products;
  ProductsLoaded({
    required this.categories,
    required this.products,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductsLoaded &&
        listEquals(other.categories, categories) &&
        listEquals(other.products, products);
  }

  @override
  int get hashCode => categories.hashCode ^ products.hashCode;

  @override
  String toString() =>
      'ProductsLoaded(categories: $categories, products: $products)';
}

class ProductsFailed extends ProductsState {
  final String errorMsg;
  ProductsFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductsFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'ProductsFailed(errorMsg: $errorMsg)';
}
