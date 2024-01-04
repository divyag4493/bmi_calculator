import 'package:flutter/material.dart';

const textStyle = TextStyle(
  color: Color(0xFFffffff),
  fontSize: 20.0,
  fontWeight: FontWeight.w700
);
const textStyle1 = TextStyle(
  color: Color(0xFFffffff),
  fontSize: 60.0,
  fontWeight: FontWeight.w700,
);

const textStyle2 = TextStyle(
  color: Color(0xFFffffff),
  fontSize: 25.0,
  fontWeight: FontWeight.w700,
);

class DataContainer extends StatelessWidget {
  DataContainer({required this.icon, this.title});

  IconData? icon;
  String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        Text(title.toString(), style: textStyle),
      ],
    );
  }
}
