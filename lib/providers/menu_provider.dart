import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/models/ingredient.dart';
import 'package:ohmyfood_flutter/models/menu.dart';
import 'package:ohmyfood_flutter/models/menu_type.dart';

class MenuProvider with ChangeNotifier {
  bool _isUpdate = false;
  List<Menu> _menus = [
    Menu(
      id: '1',
      name: 'Pancakes - S',
      description: 'Oranges, Pecan, Maple syrup, Mascarpone',
      discountPercent: 0.0,
      imageUrl: 'images/pancake_menu.jpg',
      price: 1200,
      ingredients: [
        Ingredient(
          id: DateTime.now().toIso8601String(),
          name: 'Cheese',
          oneOrMore: true,
          price: 500,
        ),
        Ingredient(
          id: DateTime.now().toIso8601String(),
          name: 'Onion',
          oneOrMore: false,
          price: 500,
        ),
        Ingredient(
          id: DateTime.now().toIso8601String(),
          name: 'Bacon',
          oneOrMore: false,
          price: 500,
        ),
      ],
    ),
    Menu(
      id: '2',
      name: 'Pancakes - M',
      description: 'Oranges, Pecan, Maple syrup, Mascarpone',
      discountPercent: 0.0,
      imageUrl: 'images/pancake_menu.jpg',
      price: 1200,
      ingredients: [
        Ingredient(
          id: DateTime.now().toIso8601String(),
          name: 'Cheese',
          oneOrMore: true,
          price: 500,
        ),
        Ingredient(
          id: DateTime.now().toIso8601String(),
          name: 'Onion',
          oneOrMore: false,
          price: 500,
        ),
        Ingredient(
          id: DateTime.now().toIso8601String(),
          name: 'Bacon',
          oneOrMore: false,
          price: 500,
        ),
      ],
    ),
    Menu(
      id: '3',
      name: 'Pancakes - L',
      description: 'Oranges, Pecan, Maple syrup, Mascarpone',
      discountPercent: 0.0,
      imageUrl: 'images/pancake_menu.jpg',
      price: 1200,
      ingredients: [
        Ingredient(
          id: DateTime.now().toIso8601String(),
          name: 'Cheese',
          oneOrMore: true,
          price: 500,
        ),
        Ingredient(
          id: DateTime.now().toIso8601String(),
          name: 'Onion',
          oneOrMore: false,
          price: 500,
        ),
        Ingredient(
          id: DateTime.now().toIso8601String(),
          name: 'Bacon',
          oneOrMore: false,
          price: 500,
        ),
      ],
    ),
    // Menu(
    //   id: '4',
    //   name: 'Pancakes - S',
    //   description: 'Oranges, Pecan, Maple syrup, Mascarpone',
    //   discountPercent: 0.0,
    //   imageUrl: 'images/pancake_menu.jpg',
    //   price: 1200,
    //   ingredients: [
    //     Ingredient(
    //       id: DateTime.now().toIso8601String(),
    //       name: 'Cheese',
    //       oneOrMore: true,
    //       price: 500,
    //     ),
    //     Ingredient(
    //       id: DateTime.now().toIso8601String(),
    //       name: 'Onion',
    //       oneOrMore: false,
    //       price: 500,
    //     ),
    //     Ingredient(
    //       id: DateTime.now().toIso8601String(),
    //       name: 'Bacon',
    //       oneOrMore: false,
    //       price: 500,
    //     ),
    //   ],
    // ),
    // Menu(
    //   id: '5',
    //   name: 'Pancakes - M',
    //   description: 'Oranges, Pecan, Maple syrup, Mascarpone',
    //   discountPercent: 0.0,
    //   imageUrl: 'images/pancake_menu.jpg',
    //   price: 1200,
    //   ingredients: [
    //     Ingredient(
    //       id: DateTime.now().toIso8601String(),
    //       name: 'Cheese',
    //       oneOrMore: true,
    //       price: 500,
    //     ),
    //     Ingredient(
    //       id: DateTime.now().toIso8601String(),
    //       name: 'Onion',
    //       oneOrMore: false,
    //       price: 500,
    //     ),
    //     Ingredient(
    //       id: DateTime.now().toIso8601String(),
    //       name: 'Bacon',
    //       oneOrMore: false,
    //       price: 500,
    //     ),
    //   ],
    // ),
    // Menu(
    //   id: '6',
    //   name: 'Pancakes - L',
    //   description: 'Oranges, Pecan, Maple syrup, Mascarpone',
    //   discountPercent: 0.0,
    //   imageUrl: 'images/pancake_menu.jpg',
    //   price: 1200,
    //   ingredients: [
    //     Ingredient(
    //       id: DateTime.now().toIso8601String(),
    //       name: 'Cheese',
    //       oneOrMore: true,
    //       price: 500,
    //     ),
    //     Ingredient(
    //       id: DateTime.now().toIso8601String(),
    //       name: 'Onion',
    //       oneOrMore: false,
    //       price: 500,
    //     ),
    //     Ingredient(
    //       id: DateTime.now().toIso8601String(),
    //       name: 'Bacon',
    //       oneOrMore: false,
    //       price: 500,
    //     ),
    //   ],
    // ),
    // Menu(
    //   id: '7',
    //   name: 'Pancakes - S',
    //   description: 'Oranges, Pecan, Maple syrup, Mascarpone',
    //   discountPercent: 0.0,
    //   imageUrl: 'images/pancake_menu.jpg',
    //   price: 1200,
    //   ingredients: [
    //     Ingredient(
    //       id: DateTime.now().toIso8601String(),
    //       name: 'Cheese',
    //       oneOrMore: true,
    //       price: 500,
    //     ),
    //     Ingredient(
    //       id: DateTime.now().toIso8601String(),
    //       name: 'Onion',
    //       oneOrMore: false,
    //       price: 500,
    //     ),
    //     Ingredient(
    //       id: DateTime.now().toIso8601String(),
    //       name: 'Bacon',
    //       oneOrMore: false,
    //       price: 500,
    //     ),
    //   ],
    // ),
    // Menu(
    //   id: '8',
    //   name: 'Pancakes - M',
    //   description: 'Oranges, Pecan, Maple syrup, Mascarpone',
    //   discountPercent: 0.0,
    //   imageUrl: 'images/pancake_menu.jpg',
    //   price: 1200,
    //   ingredients: [
    //     Ingredient(
    //       id: DateTime.now().toIso8601String(),
    //       name: 'Cheese',
    //       oneOrMore: true,
    //       price: 500,
    //     ),
    //     Ingredient(
    //       id: DateTime.now().toIso8601String(),
    //       name: 'Onion',
    //       oneOrMore: false,
    //       price: 500,
    //     ),
    //     Ingredient(
    //       id: DateTime.now().toIso8601String(),
    //       name: 'Bacon',
    //       oneOrMore: false,
    //       price: 500,
    //     ),
    //   ],
    // ),
    // Menu(
    //   id: '9',
    //   name: 'Pancakes - L',
    //   description: 'Oranges, Pecan, Maple syrup, Mascarpone',
    //   discountPercent: 0.0,
    //   imageUrl: 'images/pancake_menu.jpg',
    //   price: 1200,
    //   ingredients: [
    //     Ingredient(
    //       id: DateTime.now().toIso8601String(),
    //       name: 'Cheese',
    //       oneOrMore: true,
    //       price: 500,
    //     ),
    //     Ingredient(
    //       id: DateTime.now().toIso8601String(),
    //       name: 'Onion',
    //       oneOrMore: false,
    //       price: 500,
    //     ),
    //     Ingredient(
    //       id: DateTime.now().toIso8601String(),
    //       name: 'Bacon',
    //       oneOrMore: false,
    //       price: 500,
    //     ),
    //   ],
    // ),
  ];
  List<MenuType> _menuTypes = [
    MenuType(
      id: DateTime.now().toIso8601String(),
      name: 'Breakfasts',
      active: true,
    ),
    MenuType(
      id: DateTime.now().toIso8601String(),
      name: 'Main dishes',
    ),
    MenuType(
      id: DateTime.now().toIso8601String(),
      name: 'Desserts',
    ),
  ];
  String _menuId;

  List<MenuType> get menuTypes => _menuTypes;
  List<Menu> get menus => _menus;
  String get menuId => _menuId;
  Menu get currentMenu =>
      _menus.firstWhere((element) => element.id == _menuId, orElse: () => null);
  bool get isUpdate => _isUpdate;

  void setIsUpdate(bool isUpdate) {
    _isUpdate = isUpdate;
    notifyListeners();
  }

  void setMenuTypes(List<MenuType> menuTypes) {
    _menuTypes = menuTypes;
    notifyListeners();
  }

  void setMenus(List<Menu> menus) {
    _menus = menus;
    notifyListeners();
  }

  void updateMenu(Menu menu) {
    final index = _menus.indexWhere((element) => element.id == menu.id);
    if (index >= 0) {
      _menus[index] = menu.getClone();
      notifyListeners();
    }
  }

  void setMenuId(String menuId) {
    _menuId = menuId;
    notifyListeners();
  }
}
