import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherForecastNextDays extends StatefulWidget {
  bool todayForecastVisible = true;
  WeatherForecastNextDays({
    required this.todayForecastVisible,
    Key? key,
  }) : super(key: key);

  @override
  State<WeatherForecastNextDays> createState() => _WeatherForecastNextDaysState();
}

class _WeatherForecastNextDaysState extends State<WeatherForecastNextDays> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  widget.todayForecastVisible = !widget.todayForecastVisible;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
                      Text(
                          'Hoje',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ],
                  ),
                  const Text('Nos próximos 7 dias', style: TextStyle(fontSize: 26,
                      color: Colors.white, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .45,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 12,
                itemBuilder: (context, i){
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Seg', style: TextStyle(fontSize: 22,
                            color: Colors.white)),
                        Row(
                          children: [
                            Lottie.asset('assets/animations/sunny.json', width: 30),
                            const Text('Ensolarado', style: TextStyle(fontSize: 22,
                                color: Colors.white)),
                          ],
                        ),
                        const Text('min 23º max 28º', style: TextStyle(fontSize: 22,
                            color: Colors.white)),
                      ],
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
