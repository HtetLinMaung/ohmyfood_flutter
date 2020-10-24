import 'package:ohmyfood_flutter/models/ingredient.dart';
import 'package:ohmyfood_flutter/models/menu_type.dart';

class Menu {
  final String id;
  final String name;
  final String description;
  final double price;
  final double discountPercent;
  final String imageUrl;
  final List<MenuType> menuType;
  final List<Ingredient> ingredients;

  Menu({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discountPercent,
    this.imageUrl,
    this.menuType,
    this.ingredients,
  });

  Menu getClone() {
    return Menu(
      id: id,
      price: price,
      ingredients: ingredients.map((e) => e.getClone()).toList(),
      name: name,
      description: description,
      discountPercent: discountPercent,
      imageUrl: imageUrl,
      menuType: menuType,
    );
  }
}
