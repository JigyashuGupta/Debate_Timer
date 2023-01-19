import 'package:flutter/material.dart';

class custom_box extends StatelessWidget {
  final String? text;

  custom_box({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 10,
      height: MediaQuery.of(context).size.height / 20,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black),
      ),
      child: Center(
          child: Text(
        text!,
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
    );
  }
}
