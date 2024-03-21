import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SOutlinedButton extends StatelessWidget {
  const SOutlinedButton({
    super.key,
    required this.onPressed,
    required this.child,
    // this.color = Colors.white,
  });

  final VoidCallback onPressed;
  final Widget child;
  // final Color color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: child,
    );
  }
}
