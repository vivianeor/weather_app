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
    return Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                Icon(Icons.ac_unit),
                TextLabel(label: '24º'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextLabel(label: 'humidade'),
                TextLabelBold(label:'63%'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextLabel(label:'uv index'),
                TextLabelBold(label:'2'),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Icon(Icons.ac_unit),
                TextLabel(label: '11º'),
              ],
            ),
            Row(
              children: [
                TextLabel(label: 'vento'),
                TextLabelBold(label:'5 m/s'),
              ],
            ),
            Row(
              children: [
                TextLabel(label:'pressão'),
                TextLabelBold(label:'764'),
              ],
            )
          ],
        ),
      ],
    );
  }
}
