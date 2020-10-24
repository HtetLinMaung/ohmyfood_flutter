import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageBackground extends StatelessWidget {
  final Widget child;
  final ImageProvider<Object> image;

  ImageBackground({
    this.child,
    this.image = const AssetImage('images/ma-la-xiang-guo-10.jpg'),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
