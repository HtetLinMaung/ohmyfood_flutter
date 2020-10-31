import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:ohmyfood_flutter/components/button/circle_button.dart';
import 'package:ohmyfood_flutter/components/container/app_layout.dart';
import 'package:ohmyfood_flutter/components/menu_screen/menu_list.dart';
import 'package:ohmyfood_flutter/components/menu_screen/menu_type_list.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:ohmyfood_flutter/models/category.dart';

class MenuScreen extends StatefulWidget {
  static const routeName = 'MenuScreen';

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  ScrollController _scrollController = ScrollController();
  bool _sticky = false;
  // @override
  // Widget build(BuildContext context) {
  //   final Category category = ModalRoute.of(context).settings.arguments;
  //
  //   return AppLayout(
  //     body: Column(
  //       children: [
  //         Expanded(
  //           child: Hero(
  //             tag: 'category_image${category.id}',
  //             child: Material(
  //               type: MaterialType.transparency,
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   border: Border.all(
  //                     color: Colors.white,
  //                     width: 0,
  //                   ),
  //                   image: DecorationImage(
  //                     image: AssetImage(category.imageUrl),
  //                     alignment: Alignment.topCenter,
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //                 child: Column(
  //                   children: [
  //                     Expanded(
  //                       flex: 6,
  //                       child: Padding(
  //                         padding: EdgeInsets.symmetric(
  //                           vertical: 30,
  //                           horizontal: 10,
  //                         ),
  //                         child: Column(
  //                           children: [
  //                             Row(
  //                               crossAxisAlignment: CrossAxisAlignment.center,
  //                               children: [
  //                                 IconButton(
  //                                   color: Color(0xff717478),
  //                                   icon: Icon(
  //                                     Icons.arrow_back_ios,
  //                                     size: 20,
  //                                   ),
  //                                   onPressed: () => Navigator.pop(context),
  //                                 ),
  //                                 Expanded(
  //                                   child: Text(''),
  //                                 ),
  //                                 CircleButton(
  //                                   margin: EdgeInsets.all(10),
  //                                   size: 33,
  //                                   child: Icon(
  //                                     Icons.search,
  //                                     color: kNormalFontColor,
  //                                     size: 20,
  //                                   ),
  //                                   onPress: () {},
  //                                 ),
  //                                 CircleButton(
  //                                   size: 33,
  //                                   child: Icon(
  //                                     Icons.list,
  //                                     color: kNormalFontColor,
  //                                     size: 20,
  //                                   ),
  //                                   onPress: () {},
  //                                 ),
  //                               ],
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                     Expanded(
  //                       child: Container(
  //                         decoration: BoxDecoration(
  //                           border: Border.all(
  //                             color: Colors.white,
  //                           ),
  //                           color: Colors.white,
  //                           borderRadius: BorderRadius.vertical(
  //                             top: Radius.circular(45),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         Expanded(
  //           flex: 2,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 30.0),
  //                 child: Text(
  //                   category.name,
  //                   style: TextStyle(
  //                     fontSize: 32,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 30.0),
  //                 child: Wrap(
  //                   children: List.generate(
  //                     category.tags.length,
  //                     (index) => Transform.scale(
  //                       child: Chip(
  //                         padding: EdgeInsets.zero,
  //                         label: Text(category.tags[index]),
  //                         labelStyle: TextStyle(
  //                           fontSize: 14,
  //                           color: Color(0xffA2A3A6),
  //                         ),
  //                         backgroundColor: kTagColor,
  //                         materialTapTargetSize:
  //                             MaterialTapTargetSize.shrinkWrap,
  //                       ),
  //                       alignment: Alignment.centerLeft,
  //                       scale: 0.8,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(
  //                   left: 33.0,
  //                   right: 33.0,
  //                   top: 15,
  //                   bottom: 30,
  //                 ),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text(category.availableTime),
  //                     Text(
  //                       'Min - ${category.price} KS',
  //                       style: TextStyle(
  //                         color: kNormalFontColor,
  //                         fontSize: 12,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               MenuTypeList(),
  //               MenuList(),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context).settings.arguments;

    return AppLayout(
      body: Stack(
        children: [
          NotificationListener(
            onNotification: (_) {
              if (_scrollController.position.pixels > 357) {
                if (!_sticky) {
                  setState(() {
                    _sticky = true;
                  });
                }
              } else {
                if (_sticky) {
                  setState(() {
                    _sticky = false;
                  });
                }
              }
              return true;
            },
            child: ListView(
              controller: _scrollController,
              padding: EdgeInsets.only(
                bottom: 300,
              ),
              children: [
                Container(
                  height: 250,
                  child: Hero(
                    tag: 'category_image${category.id}',
                    child: Material(
                      type: MaterialType.transparency,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 0,
                          ),
                          image: DecorationImage(
                            image: AssetImage(category.imageUrl),
                            alignment: Alignment.topCenter,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 6,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 30,
                                  horizontal: 10,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          color: Color(0xff717478),
                                          icon: Icon(
                                            Icons.arrow_back_ios,
                                            size: 20,
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        ),
                                        Expanded(
                                          child: Text(''),
                                        ),
                                        CircleButton(
                                          margin: EdgeInsets.all(10),
                                          size: 33,
                                          child: Icon(
                                            Icons.search,
                                            color: kNormalFontColor,
                                            size: 20,
                                          ),
                                          onPress: () {},
                                        ),
                                        CircleButton(
                                          size: 33,
                                          child: Icon(
                                            Icons.list,
                                            color: kNormalFontColor,
                                            size: 20,
                                          ),
                                          onPress: () {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(45),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    category.name,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Wrap(
                    children: List.generate(
                      category.tags.length,
                      (index) => Transform.scale(
                        child: Chip(
                          padding: EdgeInsets.zero,
                          label: Text(category.tags[index]),
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Color(0xffA2A3A6),
                          ),
                          backgroundColor: kTagColor,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        alignment: Alignment.centerLeft,
                        scale: 0.8,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 33.0,
                    right: 33.0,
                    top: 15,
                    bottom: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(category.availableTime),
                      Text(
                        'Min - ${category.price} KS',
                        style: TextStyle(
                          color: kNormalFontColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                MenuTypeList(),
                MenuList(),
              ],
            ),
          ),
          _sticky
              ? Positioned(
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(top: 35.0),
                    child: MenuTypeList(),
                  ),
                )
              : Text(''),
        ],
      ),
    );
  }
}
