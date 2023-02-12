import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherForecastNow extends StatelessWidget {
  final double height;
  final bool isSmallSize;

  const WeatherForecastNow({
    required this.height,
    required this.isSmallSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      height: isSmallSize ? MediaQuery.of(context).size.height * .6 : MediaQuery.of(context).size.height * .5,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70), bottomRight: Radius.circular(70)),
        gradient: LinearGradient(
            begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[Color(0Xff15bff6), Color(0Xff1490d8), Color(0Xff126cf3)]),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: isSmallSize
            ? AnimatedOpacity(
                key: const Key("key1"),
                opacity: isSmallSize ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Icon(Icons.pin_drop, size: 25, color: Colors.white),
                          SizedBox(width: 5),
                          Text('Piracicaba', style: TextStyle(fontSize: 25, color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: [
                          Lottie.asset('assets/animations/sunny.json', width: 160),
                          const Text('31º',
                              style: TextStyle(fontSize: 85, fontFamily: 'Lato Bold', fontWeight: FontWeight.normal, color: Colors.white)),
                          const Text('Ensolarado', style: TextStyle(fontSize: 25, color: Colors.white))
                        ],
                      )
                    ],
                  ),
                ),
              )
            : AnimatedOpacity(
                key: const Key("key2"),
                opacity: !isSmallSize ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.calendar_month, size: 25, color: Colors.white),
                        SizedBox(width: 5),
                        Text('7 dias', style: TextStyle(fontSize: 25, color: Colors.white)),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset('assets/animations/sunny.json', width: MediaQuery.of(context).size.height * .2),
                                const SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Amanhã', style: TextStyle(fontSize: 30, color: Colors.white)),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        const Text('20º', style: TextStyle(fontSize: 60, color: Colors.white)),
                                        Text('/17º', style: TextStyle(fontSize: 25, color: const Color(0xFFffffff).withOpacity(0.5))),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
