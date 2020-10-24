import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/models/cart_item.dart';
import 'package:ohmyfood_flutter/models/menu.dart';

class AppProvider with ChangeNotifier {
  List<CartItem> _carts = [];
  String _refId = '';

  List<CartItem> get carts => _carts;

  double get subTotal => _carts.length > 0
      ? _carts
          .map((e) => e.getTotal() * e.quantity)
          .toList()
          .reduce((value, element) => value + element)
      : 0;

  double get discountPrice => 0;
  String get refId => _refId;

  void setRefId(String refId) {
    _refId = refId;
  }

  void setCarts(List<CartItem> carts) {
    _carts = carts.where((element) => element.quantity > 0).toList();
    notifyListeners();
  }

  void updateCartByMenu(Menu menu) {
    final oldIndex = carts.indexWhere((element) => element.menu.id == menu.id);
    final index = _indexOf(menu);
    if (index >= 0 && index != oldIndex) {
      carts[index].quantity++;
    } else {
      _carts[oldIndex] = CartItem(
        id: carts[oldIndex].id,
        quantity: carts[oldIndex].quantity,
        menu: menu.getClone(),
      );
    }
    notifyListeners();
  }

  int _indexOf(Menu menu) {
    var index = carts.indexWhere((element) => element.menu.id == menu.id);
    if (index >= 0) {
      for (var cartIngredient in carts[index].menu.ingredients) {
        var i = menu.ingredients
            .indexWhere((element) => element.id == cartIngredient.id);
        if (i == -1 ||
            cartIngredient.quantity != menu.ingredients[i].quantity) {
          index = -1;
          break;
        }
      }
    }
    return index;
  }

  void addToCart(Menu menu) {
    final index = _indexOf(menu);
    if (index >= 0) {
      carts[index].quantity++;
    } else {
      carts.add(CartItem(
        id: DateTime.now().toIso8601String(),
        menu: menu.getClone(),
      ));
    }
    notifyListeners();
  }
}
