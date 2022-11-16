import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/models/cart.dart';

List<Cart> cartItem = [];

class CartInsideNotifier extends StateNotifier<List<Cart>> {
  CartInsideNotifier() : super(cartItem);

  void addCart(Cart cart) {
    state = [
      for (final cartItem in state)
        if (cartItem.id == cart.id)
          cartItem.copyWith(quantity: cartItem.quantity++)
        else
          ...state,
      cart
    ];
  }
}

final cartInsideProvider =
    StateNotifierProvider<CartInsideNotifier, List<Cart>>((ref) {
  return CartInsideNotifier();
});
