import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/components/button/main_button.dart';
import 'package:ohmyfood_flutter/components/container/image_background.dart';
import 'package:ohmyfood_flutter/components/form/filled_input.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';
import 'package:ohmyfood_flutter/screens/home_screen.dart';
import 'package:ohmyfood_flutter/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _phoneErrorText = '';
  String _passwordErrorText = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: ImageBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Text(''),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(35),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          'Sign in with',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: kOrangeColor,
                          ),
                        ),
                      ),
                      FilledInput(
                        keyboardType: TextInputType.phone,
                        controller: _phoneController,
                        errorText: _phoneErrorText,
                        onChanged: (text) {
                          setState(() {
                            _phoneErrorText = '';
                            if (text.length < 9 || text.length > 11) {
                              _phoneErrorText =
                                  'Phone number must between 9 and 11 characters!';
                            }
                          });
                        },
                        hintText: 'Phone',
                      ),
                      FilledInput(
                        obscureText: true,
                        controller: _passwordController,
                        errorText: _passwordErrorText,
                        onChanged: (text) {
                          setState(() {
                            _passwordErrorText = '';
                            if (text.isEmpty) {
                              _passwordErrorText =
                                  'Password must not be empty!';
                            }
                          });
                        },
                        hintText: 'Password',
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: Text(
                          'Forget password?',
                          style: TextStyle(
                            color: kLabelColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MainButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, HomeScreen.routeName),
                              title: 'Sign in',
                              color: kOrangeColor,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('New here?'),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: GestureDetector(
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                    color: kBlueColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                onTap: () => Navigator.pushNamed(
                                    context, SignupScreen.routeName),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
