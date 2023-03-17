import 'package:flutter/material.dart';

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
        Text('17'),
        Text('ºC'),
        Column(
          children: [
            Icon(Icons.ac_unit),
            Text('ensolarado'),
            Row(
              children: [
                Text('feels like'),
                Text('16º'),
              ],
            ),
          ],
        )
      ],
    );
  }
}
