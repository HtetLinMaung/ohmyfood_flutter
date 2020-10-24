import 'package:flutter/material.dart';

class CategoryType {
  final String id;
  final String name;
  final String image;
  bool active;

  CategoryType({
    this.id,
    this.name,
    this.image,
    this.active = false,
  });
}
