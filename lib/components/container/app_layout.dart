import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:ohmyfood_flutter/providers/app_provider.dart';
import 'package:ohmyfood_flutter/screens/cart_screen.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';

class AppLayout extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget appBar;

  AppLayout({
    this.body,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: body,
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, CartScreen.routeName),
        backgroundColor: Colors.white,
        child: Badge(
          showBadge: appProvider.carts.length > 0,
          badgeContent: Text(appProvider.carts.length.toString()),
          badgeColor: kDarkYellowColor,
          child: Icon(
            Icons.add_shopping_cart_rounded,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
