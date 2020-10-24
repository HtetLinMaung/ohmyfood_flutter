import 'package:flutter/material.dart';

const kInputDecoration = InputDecoration(
  isDense: true,
  counterStyle: TextStyle(
    height: double.minPositive,
  ),
  counterText: '',
);

class OtpInput extends StatefulWidget {
  final TextEditingController controller;

  const OtpInput({
    this.controller,
  });

  @override
  _OtpInputState createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<FocusNode> _nodes = [FocusNode(), FocusNode(), FocusNode(), FocusNode()];

  void _changeHandler(int n) {
    print('n: $n');
    if (n < 3) {
      _nodes[n + 1].requestFocus();
    } else {
      FocusScope.of(context).unfocus();
    }
    print(_controllers[3].text);
    widget.controller.text = _controllers[0].text +
        _controllers[1].text +
        _controllers[2].text +
        _controllers[3].text;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: TextField(
            focusNode: _nodes[0],
            controller: _controllers[0],
            textAlign: TextAlign.center,
            maxLength: 1,
            keyboardType: TextInputType.phone,
            decoration: kInputDecoration,
            onChanged: (text) => _changeHandler(0),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(''),
        ),
        Expanded(
          flex: 3,
          child: TextField(
            focusNode: _nodes[1],
            controller: _controllers[1],
            textAlign: TextAlign.center,
            maxLength: 1,
            keyboardType: TextInputType.phone,
            decoration: kInputDecoration,
            onChanged: (text) => _changeHandler(1),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(''),
        ),
        Expanded(
          flex: 3,
          child: TextField(
            focusNode: _nodes[2],
            controller: _controllers[2],
            textAlign: TextAlign.center,
            maxLength: 1,
            keyboardType: TextInputType.phone,
            decoration: kInputDecoration,
            onChanged: (text) => _changeHandler(2),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(''),
        ),
        Expanded(
          flex: 3,
          child: TextField(
            focusNode: _nodes[3],
            controller: _controllers[3],
            textAlign: TextAlign.center,
            maxLength: 1,
            keyboardType: TextInputType.phone,
            decoration: kInputDecoration,
            onChanged: (text) => _changeHandler(3),
          ),
        ),
      ],
    );
  }
}
