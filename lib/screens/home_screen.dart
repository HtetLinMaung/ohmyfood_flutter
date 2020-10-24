import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/button/circle_button.dart';
import 'package:ohmyfood_flutter/components/card/category_card.dart';
import 'package:ohmyfood_flutter/components/container/app_layout.dart';
import 'package:ohmyfood_flutter/components/tag/card_tag.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:ohmyfood_flutter/models/category.dart';
import 'package:ohmyfood_flutter/models/category_type.dart';
import 'package:ohmyfood_flutter/screens/menu_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> _categories = [
    Category(
      id: '1',
      name: 'Sweety bar',
      price: 20,
      tags: ['American', 'Italian'],
      types: [],
      imageUrl: 'images/sweety-bar.jpg',
      discountPercent: 0,
      availableTime: '10:00 - 22:00',
    ),
    Category(
      id: '2',
      name: 'Noddle',
      price: 20,
      tags: ['Italian'],
      types: [],
      imageUrl: 'images/noddle.jpg',
      discountPercent: 0,
      availableTime: '10:00 - 22:00',
    ),
  ];
  List<CategoryType> _categoryTypes = [
    CategoryType(
      name: 'All categories',
      image: 'spoon_fork',
      active: true,
    ),
    CategoryType(
      name: 'Noddle & Soup',
      image: 'ramen',
      active: false,
    ),
    CategoryType(
      name: 'Drink',
      image: 'drink',
      active: false,
    ),
    CategoryType(
      name: 'Snack',
      image: 'snack',
      active: false,
    ),
    CategoryType(
      name: 'Spicy & Hot',
      image: 'spicy',
      active: false,
    ),
    CategoryType(
      name: 'Pancake',
      image: 'pancake',
      active: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(
            left: 20,
          ),
          child: Image(
            image: AssetImage('images/setting_menu.png'),
          ),
        ),
        actions: [
          CircleButton(
            onPress: () {},
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Icon(
              Icons.search,
              color: kNormalFontColor,
            ),
          ),
          CircleButton(
            onPress: () {},
            margin: EdgeInsets.only(
              left: 5,
              right: 20,
            ),
            child: Icon(
              Icons.list,
              color: kNormalFontColor,
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 27,
                right: 27,
                top: 10,
              ),
              child: Text(
                'Hello, Shwe Su',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 27,
                right: 27,
                bottom: 20,
              ),
              child: Text(
                'What do you want to eat?',
                style: TextStyle(
                  fontSize: 20,
                  color: kNormalFontColor,
                ),
              ),
            ),
            Container(
              height: 105,
              child: ListView.builder(
                itemCount: _categoryTypes.length,
                padding: EdgeInsets.only(
                  left: 24,
                  top: 15,
                  bottom: 15,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) {
                  return CardTag(
                    categoryType: _categoryTypes[i],
                    onTap: () {
                      setState(() {
                        _categoryTypes
                            .forEach((element) => element.active = false);
                        _categoryTypes[i].active = true;
                      });
                    },
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 27,
              ),
              child: Text(
                _categoryTypes.firstWhere((element) => element.active).name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...List.generate(
              _categories.length,
              (index) => CategoryCard(
                key: Key(_categories[index].id),
                onTap: () => Navigator.pushNamed(
                  context,
                  MenuScreen.routeName,
                  arguments: _categories[index],
                ),
                category: _categories[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
