import 'package:flutter/material.dart';

class ButtonUI extends StatelessWidget {
  const ButtonUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Text",
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.touch_app),
              color: Colors.grey,
            ),
          ],
        ));
  }
}
