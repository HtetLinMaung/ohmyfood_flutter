import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:ohmyfood_flutter/models/menu_type.dart';
import 'package:ohmyfood_flutter/providers/menu_provider.dart';
import 'package:provider/provider.dart';

class MenuTypeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = context.watch<MenuProvider>();

    return Container(
      height: 30,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 30),
        scrollDirection: Axis.horizontal,
        itemCount: store.menuTypes.length,
        itemBuilder: (ctx, i) {
          return Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Container(
              height: 30,
              child: GestureDetector(
                onTap: () {
                  final store = context.read<MenuProvider>();

                  store.setMenuTypes(store.menuTypes.map((e) {
                    if (e.id == store.menuTypes[i].id) {
                      return MenuType(
                        id: e.id,
                        name: e.name,
                        active: true,
                      );
                    }
                    return MenuType(
                      id: e.id,
                      name: e.name,
                    );
                  }).toList());
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      store.menuTypes[i].name,
                      style: TextStyle(
                        fontSize: 20,
                        color: store.menuTypes[i].active
                            ? Colors.black
                            : kNormalFontColor,
                        fontWeight: store.menuTypes[i].active
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      width: store.menuTypes[i].active ? 22 : 0,
                      height: 3,
                      color: kOrangeColor,
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
