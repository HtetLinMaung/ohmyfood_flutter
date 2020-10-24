import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Color color;
  final TextStyle style;
  final String title;
  final Function onPressed;
  final double elevation;

  const MainButton({
    this.color,
    this.title,
    @required this.onPressed,
    this.elevation,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: RaisedButton(
        elevation: elevation,
        onPressed: onPressed,
        color: color,
        textColor: Colors.white,
        child: Text(
          title,
          style: style,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
