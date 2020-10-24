import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/cart_screen/cart_action.dart';
import 'package:ohmyfood_flutter/components/cart_screen/cart_head_bar.dart';
import 'package:ohmyfood_flutter/components/cart_screen/cart_list.dart';

class CartScreen extends StatefulWidget {
  static const routeName = 'CartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CartHeadBar(),
            CartList(),
            CartAction(),
          ],
        ),
      ),
    );
  }
}
