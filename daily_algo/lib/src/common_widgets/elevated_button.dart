import 'package:flutter/material.dart';

class SElevatedButton extends StatelessWidget {
  const SElevatedButton({
    super.key, 
    required this.onPressed, 
    required this.child, 
    this.color = Colors.white,
  });

  final VoidCallback onPressed;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: color,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: child,
    );
  }
}
