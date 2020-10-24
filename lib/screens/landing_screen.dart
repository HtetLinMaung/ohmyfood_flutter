import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/screens/get_started_screen.dart';

class LandingScreen extends StatefulWidget {
  static const routeName = 'LandingScreen';

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  void _navigate() async {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, GetStartedScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
