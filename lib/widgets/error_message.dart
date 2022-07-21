import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class ErrorMessage extends StatelessWidget {
  String message;

  ErrorMessage({this.message});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: 0.5,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Svg(
                    "assets/astronaut.svg",
                  ),
                  fit: BoxFit.fitHeight),
            ),
          ),
        ),
        Text(
          "${message.toUpperCase()}",
          style: TextStyle(
            fontSize: 30,
            fontFamily: "arciform",
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color:  Color(0xFF1C3177),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
