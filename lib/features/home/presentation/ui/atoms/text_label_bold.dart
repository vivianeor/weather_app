import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLabelBold extends StatelessWidget {
  final String label;

  const TextLabelBold({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(fontSize: 15), fontWeight: FontWeight.w800),
    );
  }
}
