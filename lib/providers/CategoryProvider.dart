import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/models/category.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [
    Category(
      id: '1',
      name: 'Sweety bar',
      price: 20,
      tags: ['American', 'Italian'],
      types: [],
      discountPercent: 0,
      availableTime: '10:00 - 22:00',
    ),
  ];

  List<Category> get categories => _categories;

  void setCategories(List<Category> categories) {
    _categories = categories;
    notifyListeners();
  }
}
