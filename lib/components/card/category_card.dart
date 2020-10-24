import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:ohmyfood_flutter/models/category.dart';

class CategoryCard extends StatefulWidget {
  final Category category;
  final Function onTap;

  CategoryCard({
    this.category,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(
        milliseconds: 150,
      ),
      vsync: this,
    );
    _animation =
        Tween<double>(begin: 1, end: 0.95).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 27,
          vertical: 15,
        ),
        child: InkWell(
          onTap: () {
            _animationController.forward().whenComplete(() {
              _animationController.reverse().whenComplete(widget.onTap);
            });
          },
          child: Hero(
            tag: 'category_image${widget.category.id}',
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                height: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(widget.category.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(''),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          // vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.category.name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Min - ${widget.category.price} KS',
                                  style: TextStyle(
                                    color: kNormalFontColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                ...List.generate(
                                  widget.category.tags.length,
                                  (index) => Transform.scale(
                                    child: Chip(
                                      padding: EdgeInsets.zero,
                                      label: Text(widget.category.tags[index]),
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
                                Expanded(
                                  child: Text(''),
                                ),
                                Text(widget.category.availableTime),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
