import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/features/home/presentation/ui/atoms/text_label_bold.dart';

import '../atoms/text_label.dart';

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
        TextLabel(label: 'ºC'),
        Column(
          children: [
            Icon(Icons.ac_unit),
            TextLabelBold(label: 'ensolarado'),
            Row(
              children: [
                TextLabel(label: 'feels like'),
                TextLabelBold(label: '16º'),
              ],
            ),
          ],
        )
      ],
    );
  }
}
