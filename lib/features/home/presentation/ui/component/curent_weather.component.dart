import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/enums/colors.dart';
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
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '17',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 170, height: 1.0),
                ),
              ),
              const SizedBox(width: 10),
              const TextLabel(label: 'ºC'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.ac_unit, color: ColorsEnum.grey),
              const SizedBox(height: 15),
              TextLabel(label: 'ensolarado'),
              const SizedBox(height: 15),
              Row(
                children: [
                  TextLabel(label: 'feels like'),
                  const SizedBox(width: 10),
                  TextLabelBold(label: '16º'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
