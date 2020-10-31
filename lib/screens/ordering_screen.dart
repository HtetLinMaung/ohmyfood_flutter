import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/button/main_button.dart';

class OrderingScreen extends StatefulWidget {
  static const routeName = 'OrderingScreen';

  @override
  _OrderingScreenState createState() => _OrderingScreenState();
}

class _OrderingScreenState extends State<OrderingScreen> {
  ImageProvider<Object> _image = AssetImage('images/place_order.png');
  String _orderStatus = 'Your order has been placed';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _image = AssetImage('images/cooking.png');
        _orderStatus = 'Your order has started preparing';
      });
    });
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        _image = AssetImage('images/ontheway.png');
        _orderStatus = 'Your order is ready to deliver';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: _image,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30.0,
              horizontal: 80,
            ),
            child: Text(
              _orderStatus,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfffdf7f1),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(12),
                child: Text(
                  '#51812924',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainButton(
                  onPressed: () => Navigator.pop(context),
                  title: 'OK',
                  color: Colors.black,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
