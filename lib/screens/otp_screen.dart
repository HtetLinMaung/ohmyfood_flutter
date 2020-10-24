import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/button/main_button.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:ohmyfood_flutter/screens/otp_verify_screen.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = 'OtpScreen';

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: 'otp',
                  child: Image.asset(
                    'images/otp_get.png',
                    scale: 1.35,
                    height: 300,
                  ),
                ),
                Text(
                  'OTP Verification',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 40.0,
                    right: 40,
                    top: 15,
                    bottom: 45,
                  ),
                  child: Text(
                    'We will send you an One Time Password on this mobile number',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xff939393),
                    ),
                  ),
                ),
                Text(
                  'Enter Mobile Number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color(0xff939393),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 75,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: '+95 - ',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 60,
                  ),
                  child: MainButton(
                    onPressed: () {
                      Navigator.pushNamed(context, OtpVerifyScreen.routeName);
                    },
                    color: kOtpBtnColor,
                    title: 'Get OTP',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
