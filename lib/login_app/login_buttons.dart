
import 'package:flutter/material.dart';

class LoginButtons extends StatelessWidget {


  final Widget image;
  final Widget text;
  final Color color;
  final double radius;
  final VoidCallback onPressed;

  const LoginButtons(
      {
        Key? key,
        required this.image,
        required this.text,
        required this.color,
        required this.radius,
        required this.onPressed
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)
            )
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          image,
          text,
          Opacity(
            opacity: 0.0,
            child: image,
          )
        ],
      ),
    );
  }
}
