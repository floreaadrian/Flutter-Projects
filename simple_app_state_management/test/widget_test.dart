import 'package:flutter_test/flutter_test.dart';

import 'package:simple_app_state_management/models/cart.dart';

void main() {
  test('adding item increases total cost', () {
    final cart = CartModel();
    final startingPrice = cart.totalPrice;
    //sa nu raman prost si sa uit
    //asta in functia anonima intra numa cand se face notify
    //nu direct, deci nu intinte sa se dea cart.add
    cart.addListener(() {
      expect(cart.totalPrice, greaterThan(startingPrice));
    });
    cart.add(Item(2));
  });
}
