import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/button/main_button.dart';
import 'package:ohmyfood_flutter/components/container/image_background.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:ohmyfood_flutter/screens/login_screen.dart';
import 'package:ohmyfood_flutter/screens/signup_screen.dart';

class StartScreen extends StatelessWidget {
  static const routeName = 'StartScreen';

  @override
  Widget build(BuildContext context) {
    return ImageBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: Row(
              children: [
                Expanded(
                  child: Text(''),
                  flex: 1,
                ),
                Expanded(
                  flex: 3,
                  child: MainButton(
                    color: kBlueColor,
                    title: "I'm new",
                    onPressed: () =>
                        Navigator.pushNamed(context, SignupScreen.routeName),
                  ),
                ),
                Expanded(
                  child: Text(''),
                  flex: 1,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: Row(
              children: [
                Expanded(
                  child: Text(''),
                  flex: 1,
                ),
                Expanded(
                  flex: 3,
                  child: MainButton(
                    color: kOrangeColor,
                    title: "I've been here",
                    onPressed: () =>
                        Navigator.pushNamed(context, LoginScreen.routeName),
                  ),
                ),
                Expanded(
                  child: Text(''),
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
