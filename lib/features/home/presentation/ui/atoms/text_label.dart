import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/enums/colors.dart';

class TextLabel extends StatelessWidget {
  final String? label;

  const TextLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label ?? '',
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 16),
        color: const Color.fromARGB(255, 117, 117, 117),
      ),
    );
  }
}
