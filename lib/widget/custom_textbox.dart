import 'package:flutter/material.dart';

class custom_text extends StatelessWidget {
  final String? text;

  custom_text({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        // fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
