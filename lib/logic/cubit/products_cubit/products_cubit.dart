import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:vending_machine/data/http/category_services.dart';
import 'package:vending_machine/data/http/product_services.dart';
import 'package:vending_machine/data/models/product_category.dart';

import '../../../data/models/product.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  Future load({required String deviceId}) async {
    try {
      emit(ProductsLoading());
      final List<ProductCategory> categories =
          await CategoryServices.getAllCategories();
      final List<Product> products = await ProductServices.getAllProducts();
      emit(ProductsLoaded(categories: categories, products: products));
    } catch (e) {
      emit(ProductsFailed(errorMsg: e.toString()));
    }
  }
}
