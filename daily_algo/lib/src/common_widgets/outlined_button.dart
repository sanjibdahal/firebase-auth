import 'package:flutter/material.dart';

class SOutlinedButton extends StatelessWidget {
  const SOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    // this.color = Colors.white,
  });

  final VoidCallback onPressed;
  final String text;
  // final Color color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
    );
  }
}
