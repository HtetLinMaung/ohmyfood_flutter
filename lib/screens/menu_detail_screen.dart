import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/button/circle_button.dart';
import 'package:ohmyfood_flutter/components/button/main_button.dart';
import 'package:ohmyfood_flutter/components/menu_detail_screen/ingredient_card.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:ohmyfood_flutter/providers/app_provider.dart';
import 'package:ohmyfood_flutter/providers/menu_provider.dart';
import 'package:ohmyfood_flutter/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class MenuDetailScreen extends StatefulWidget {
  static const routeName = 'MenuDetailScreen';

  @override
  _MenuDetailScreenState createState() => _MenuDetailScreenState();
}

class _MenuDetailScreenState extends State<MenuDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();
    final store = context.watch<MenuProvider>();
    final menu = store.currentMenu;

    if (menu == null) {
      return Container();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: -60,
            top: -90,
            child: Hero(
              tag: "menu_image${store.isUpdate ? appProvider.refId : menu.id}",
              child: Material(
                type: MaterialType.transparency,
                child: CircleAvatar(
                  radius: 180,
                  backgroundImage: AssetImage(menu.imageUrl),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 40.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.close,
                              size: 20,
                            ),
                            onTap: () {
                              context.read<MenuProvider>().setIsUpdate(false);
                              menu.ingredients
                                  .forEach((element) => element.quantity = 0);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(''),
                      ),
                      Text(
                        menu.name,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              menu.description,
                              style: TextStyle(
                                color: kNormalFontColor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(''),
                          ),
                          Text(
                            '${menu.price} KS',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              IngredientCard(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                bottom: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(''),
                  ),
                  Expanded(
                    flex: 7,
                    child: MainButton(
                      elevation: 10,
                      onPressed: () {
                        final appProvider = context.read<AppProvider>();
                        final menuProvider = context.read<MenuProvider>();

                        if (menuProvider.isUpdate) {
                          appProvider.updateCartByMenu(menu);
                        } else {
                          appProvider.addToCart(menu);
                        }

                        menu.ingredients
                            .forEach((element) => element.quantity = 0);
                        if (menuProvider.isUpdate) {
                          Navigator.pop(context);
                          menuProvider.setIsUpdate(false);
                        } else {
                          Navigator.popAndPushNamed(
                              context, CartScreen.routeName);
                        }
                      },
                      color: kDarkYellowColor,
                      title: store.isUpdate ? 'Update' : 'Add to cart',
                    ),
                  ),
                  Expanded(
                    child: Text(''),
                  ),
                  !store.isUpdate
                      ? CircleButton(
                          size: 45,
                          onPress: () => Navigator.pushNamed(
                              context, CartScreen.routeName),
                          elevation: 10,
                          // fillColor: kDarkYellowColor,
                          child: Badge(
                            showBadge: appProvider.carts.length > 0,
                            badgeContent: Text(
                              appProvider.carts.length.toString(),
                            ),
                            badgeColor: kDarkYellowColor,
                            child: Icon(
                              Icons.add_shopping_cart_rounded,
                            ),
                          ),
                        )
                      : Text(''),
                  !store.isUpdate
                      ? Expanded(
                          child: Text(''),
                        )
                      : Text(''),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
