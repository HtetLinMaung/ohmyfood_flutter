import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/models/category_type.dart';

class CardTag extends StatelessWidget {
  final Function onTap;
  final CategoryType categoryType;

  CardTag({
    this.onTap,
    this.categoryType,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: categoryType.active ? 10 : 2, // 4 is selected 3 is not
        child: Container(
          width: 70,
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 10,
          ),
          child: Image(
            image: AssetImage('images/${categoryType.image}.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
