import 'package:flutter/material.dart';

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
            Text('24º'),
            Icon(Icons.ac_unit),
            Text('11º')
          ],
        ),
        Row(
          children: [
            Text('humidade'),
            Text('63%'),
            Text('vento'),
            Text('5 m/s'),
          ],
        ),
        Row(
          children: [
            Text('uv index'),
            Text('2'),
            Text('pressão'),
            Text('764'),
          ],
        )
      ],
    );
  }
}
