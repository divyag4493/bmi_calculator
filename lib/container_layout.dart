import 'package:flutter/material.dart';

class ContainerLayout extends StatelessWidget {
  ContainerLayout({required this.boxColor, this.childWidget});

  Color? boxColor;
  Widget? childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: boxColor,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 5.0,
        //     blurRadius: 7.0,
        //     offset: Offset(0, 3),
        //   )
        // ],
      ),
    );
  }
}