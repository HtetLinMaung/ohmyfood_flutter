import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/button/main_button.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:ohmyfood_flutter/providers/app_provider.dart';
import 'package:ohmyfood_flutter/screens/map_screen.dart';
import 'package:provider/provider.dart';

class CartAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();

    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
        ),
        margin: EdgeInsets.all(0),
        elevation: 40,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SubTotal',
                  ),
                  Text('${appProvider.subTotal} KS'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount Price',
                  ),
                  Text('${appProvider.discountPrice} KS'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '${appProvider.subTotal - appProvider.discountPrice} KS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(''),
                  ),
                  Expanded(
                    flex: 8,
                    child: MainButton(
                      elevation: 1,
                      onPressed: () => Navigator.pushNamed(context, MapScreen.routeName),
                      color: kDarkYellowColor,
                      title: 'Place Order',
                    ),
                  ),
                  Expanded(
                    child: Text(''),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
