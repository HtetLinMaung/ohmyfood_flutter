import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/models/category_type.dart';

class Category {
  final String id;
  final String name;
  final List<String> tags;
  final List<String> types;
  final double price;
  final double discountPercent;
  final String availableTime;
  final String imageUrl;

  Category({
    this.id,
    this.name,
    this.tags,
    this.types,
    this.price,
    this.imageUrl,
    this.discountPercent,
    this.availableTime,
  });
}
