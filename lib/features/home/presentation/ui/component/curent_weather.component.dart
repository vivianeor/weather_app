import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/enums/colors.dart';

class CurrentWeatherComponent extends StatefulWidget {
  const CurrentWeatherComponent({Key? key}) : super(key: key);

  @override
  State<CurrentWeatherComponent> createState() => _CurrentWeatherComponentState();
}

class _CurrentWeatherComponentState extends State<CurrentWeatherComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('17', style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 50))),
        Text('ºC', style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 10))),
        Column(
          children: [
            Icon(Icons.ac_unit),
            Text(
              'ensolarado',
              style: GoogleFonts.poppins(
                  color: ColorsEnum().grey, textStyle: const TextStyle(fontSize: 20)),
            ),
            Row(
              children: [
                Text(
                  'feels like',
                  style: GoogleFonts.poppins(
                      color: ColorsEnum().grey, textStyle: const TextStyle(fontSize: 20)),
                ),
                Text(
                  '16º',
                  style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
