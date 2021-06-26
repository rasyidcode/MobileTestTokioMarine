import 'package:flutter/material.dart';

class CenteredText extends StatelessWidget {
  final String message;
  final IconData icon;
  const CenteredText({required this.message, required this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40.0),
            Text(
              message,
              style: TextStyle(
                color: Colors.white30,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
