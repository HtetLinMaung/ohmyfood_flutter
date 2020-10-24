import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/button/main_button.dart';
import 'package:ohmyfood_flutter/components/form/otp_input.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:ohmyfood_flutter/screens/home_screen.dart';

class OtpVerifyScreen extends StatefulWidget {
  static const routeName = 'OtpVerifyScreen';

  @override
  _OtpVerifyScreenState createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  TextEditingController _otpController = TextEditingController();

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
                    'images/otp_sent.png',
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
                    'Enter the OTP sent to +95 - 8802768985',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xff939393),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 45,
                  ),
                  child: OtpInput(
                    controller: _otpController,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't receive the OTP?",
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color(0xff939393),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'RESEND OTP',
                          style: TextStyle(
                            fontSize: 16,
                            color: kOrangeColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 40,
                  ),
                  child: MainButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, HomeScreen.routeName),
                    color: kOtpBtnColor,
                    title: 'Verify & Proceed',
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
