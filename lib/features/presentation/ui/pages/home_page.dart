import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//https://dribbble.com/shots/15661680-Weather-App

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff061225),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0Xff15bff6), Color(0Xff1490d8),
                  Color(0Xff126cf3)]),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Icon(Icons.pin_drop, size: 35),
                  SizedBox(width: 5),
                  Text('Piracicaba', style:
                    TextStyle(fontSize: 35)),
                ],
              ),
             Column(
               children: [
                 Lottie.asset('assets/animations/sunny.json', width: 250),
                 const Text('31º',
                   style: TextStyle(fontSize: 100,
                     fontFamily: 'Lato Bold',
                     fontWeight: FontWeight.normal,
                 )),
                 const Text('Ensolarado', style: TextStyle(fontSize: 35))
               ],
             )
            ],
          ),
        ),
      ),
    );
  }
}
