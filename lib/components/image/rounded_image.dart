import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/providers/menu_provider.dart';
import 'package:provider/provider.dart';

// Hero(
// tag: 'menu_image${store.menus[i].id}',
// child: Material(
// type: MaterialType.transparency,
// child: RoundedImage(
// image: AssetImage(store.menus[i].imageUrl),
// ),
// ),
// ),
class RoundedImage extends StatelessWidget {
  final ImageProvider<Object> image;
  final String id;

  const RoundedImage({
    Key key,
    @required this.image,
    @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'menu_image$id',
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          width: 80,
          height: 85,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
