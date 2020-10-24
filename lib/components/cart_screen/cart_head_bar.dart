import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/button/circle_button.dart';

class CartHeadBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleButton(
            size: 30,
            onPress: () => Navigator.pop(context),
            child: Icon(
              Icons.close,
              size: 20,
            ),
          ),
          Text(
            'Cart',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          CircleButton(
            size: 30,
            fillColor: Colors.transparent,
            onPress: null,
            child: null,
          ),
        ],
      ),
    );
  }
}
