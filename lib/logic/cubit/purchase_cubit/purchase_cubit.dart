import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vending_machine/data/http/cart_services.dart';
import 'package:vending_machine/data/models/cart_item.dart';
import 'package:vending_machine/data/models/new_cart_item.dart';

import '../../../data/shared/shared_services.dart';

part 'purchase_state.dart';

class PurchaseCubit extends Cubit<PurchaseState> {
  PurchaseCubit() : super(PurchaseInitial());

  Future purchase({required NewCartItem item}) async {
    try {
      emit(PurchaseLoading());
      final CartItem cartItem = await CartServices.addToCart(newItem: item);
      final String userType = await SharedServices.getUserType();
      if (userType != "user") {
        emit(PurchaseMachine());
      } else {
        emit(PurchaseUser());
      }
    } catch (e) {
      emit(PurchaseFailed(errorMsg: e.toString()));
    }
  }
}
