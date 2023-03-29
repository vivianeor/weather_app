import 'package:flutter/material.dart';
import '../atoms/text_label.dart';
import '../atoms/text_label_bold.dart';

class HourlyWeatherComponent extends StatefulWidget {
  const HourlyWeatherComponent({Key? key}) : super(key: key);

  @override
  State<HourlyWeatherComponent> createState() => _HourlyWeatherComponentState();
}

class _HourlyWeatherComponentState extends State<HourlyWeatherComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.ac_unit),
            TextLabel(label: '24º'),
            Icon(Icons.ac_unit),
            TextLabel(label: '11º'),
          ],
        ),
        Row(
          children: [
            TextLabel(label: 'humidade'),
            TextLabelBold(label:'63%'),
            TextLabel(label: 'vento'),
            TextLabelBold(label:'5 m/s'),
          ],
        ),
        Row(
          children: [
            TextLabel(label:'uv index'),
            TextLabelBold(label:'2'),
            TextLabel(label:'pressão'),
            TextLabelBold(label:'764'),
          ],
        )
      ],
    );
  }
}
