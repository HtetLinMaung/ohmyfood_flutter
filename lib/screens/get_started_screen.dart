import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/button/main_button.dart';
import 'package:ohmyfood_flutter/components/container/image_background.dart';
import 'package:ohmyfood_flutter/screens/start_screen.dart';

class GetStartedScreen extends StatelessWidget {
  static const routeName = 'GetStartedScreen';

  @override
  Widget build(BuildContext context) {
    return ImageBackground(
      child: Column(
        children: [
          Expanded(
            child: Text(''),
            flex: 7,
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Text(''),
                  flex: 3,
                ),
                Expanded(
                  flex: 4,
                  child: MainButton(
                    color: Color(0xffFF6239),
                    title: 'Get started',
                    onPressed: () =>
                        Navigator.pushNamed(context, StartScreen.routeName),
                  ),
                ),
                Expanded(
                  child: Text(''),
                  flex: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
