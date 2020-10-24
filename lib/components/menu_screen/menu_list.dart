import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/button/circle_button.dart';
import 'package:ohmyfood_flutter/components/image/rounded_image.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:ohmyfood_flutter/providers/app_provider.dart';
import 'package:ohmyfood_flutter/providers/menu_provider.dart';
import 'package:ohmyfood_flutter/screens/menu_detail_screen.dart';
import 'package:provider/provider.dart';

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = context.watch<MenuProvider>();

    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(
          bottom: 75,
        ),
        itemCount: store.menus.length,
        itemBuilder: (ctx, i) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                final store = context.read<MenuProvider>();
                store.setMenuId(store.menus[i].id);
                Navigator.pushNamed(context, MenuDetailScreen.routeName);
              },
              child: Container(
                height: 100,
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    RoundedImage(
                      id: store.menus[i].id,
                      image: AssetImage(store.menus[i].imageUrl),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              store.menus[i].name,
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              store.menus[i].description,
                              style: TextStyle(
                                fontSize: 12,
                                color: kNormalFontColor,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${store.menus[i].price} KS',
                              style: TextStyle(
                                fontSize: 16,
                                color: kBlueColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleButton(
                          onPress: () {
                            final menu = store.menus[i].getClone();
                            menu.ingredients
                                .forEach((element) => element.quantity = 1);
                            context.read<AppProvider>().addToCart(menu);
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          fillColor: kBlueColor,
                          size: 34,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
