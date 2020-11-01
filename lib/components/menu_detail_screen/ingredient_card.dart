import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/button/circle_button.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:ohmyfood_flutter/providers/menu_provider.dart';
import 'package:provider/provider.dart';

class IngredientCard extends StatelessWidget {
  final ScrollController controller;

  IngredientCard({
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final menuProvider = context.watch<MenuProvider>();
    final menu = menuProvider.currentMenu;

    return Card(
      margin: EdgeInsets.only(
        top: 30,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(35),
        ),
      ),
      elevation: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 35.0,
            ),
            child: Text(
              'Add more stuff',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: controller,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 100,
              ),
              itemCount: menu.ingredients.length,
              itemBuilder: (ctx, i) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            menu.ingredients[i].name,
                            style: TextStyle(
                              fontSize: 14,
                              color: kNormalFontColor,
                            ),
                          ),
                          Text(
                            '${menu.ingredients[i].price} kyats',
                            style: TextStyle(
                              color: kNormalFontColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      !menu.ingredients[i].oneOrMore
                          ? CircleButton(
                              size: 30,
                              onPress: () {
                                menu.ingredients[i].quantity =
                                    menu.ingredients[i].quantity < 1 ? 1 : 0;
                                context.read<MenuProvider>().updateMenu(menu);
                              },
                              fillColor: menu.ingredients[i].quantity == 1
                                  ? Colors.red
                                  : kTagColor,
                              child: Icon(
                                menu.ingredients[i].quantity == 0
                                    ? Icons.add
                                    : Icons.remove,
                                size: 16,
                                color: menu.ingredients[i].quantity == 1
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            )
                          : Row(
                              children: [
                                CircleButton(
                                  size: 25,
                                  onPress: () {
                                    if (menu.ingredients[i].quantity != 0) {
                                      menu.ingredients[i].quantity--;
                                      context
                                          .read<MenuProvider>()
                                          .updateMenu(menu);
                                    }
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    size: 16,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    menu.ingredients[i].quantity.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                CircleButton(
                                  size: 25,
                                  onPress: () {
                                    menu.ingredients[i].quantity++;
                                    context
                                        .read<MenuProvider>()
                                        .updateMenu(menu);
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
