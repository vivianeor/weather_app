import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/enums/colors.dart';
import 'package:weather_app/features/home/presentation/controllers/home_controller.dart';
import 'package:weather_app/features/home/presentation/ui/component/curent_weather.component.dart';
import 'package:weather_app/features/home/presentation/ui/component/error.component.dart';
import 'package:weather_app/features/home/presentation/ui/component/hourly_weather.component.dart';
import 'package:weather_app/features/home/presentation/ui/component/info_current_weather.component.dart';

import '../../../domain/entities/current_weather.entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = GetIt.instance<HomeController>();
  late final Future<void> initialization;
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerText = TextEditingController();

  @override
  void initState() {
    super.initState();
    //initialization = Future.microtask(() async => );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.getCurrentWeather(),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.hasError || snapshot.error != null) {
            return const ErrorComponent();
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator(color: ColorsEnum.grey));
          }
          return ValueListenableBuilder<CurrentWeatherEntity?>(
              valueListenable: controller.currentWeatherNotifier,
              builder: (context, currentWeatherResult, _) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 80),
                        child: Text(currentWeatherResult?.name ?? '',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 18))),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'teste',
                        ),
                        controller: controllerText,

                      ),
                      CurrentWeatherComponent(result: currentWeatherResult),
                      const Divider(),
                      InfoCurrentWeatherComponent(result: currentWeatherResult),
                      const Divider(),
                      HourlyWeatherComponent(),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
