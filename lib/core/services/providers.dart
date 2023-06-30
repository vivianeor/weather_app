import 'package:get_it/get_it.dart';
import 'package:weather_app/features/home/data/datasource/current_weather.datasource.dart';
import 'package:weather_app/features/home/data/repositories/current_weather.repository.impl.dart';
import 'package:weather_app/features/home/domain/repositories/current_weather.repository.dart';
import 'package:weather_app/features/home/domain/usecases/current_weather_usecase.dart';
import 'package:weather_app/features/home/external/datasource/current_weather_datasource_impl.dart';
import 'package:weather_app/features/home/presentation/controllers/home_controller.dart';

import '../../features/home/domain/usecases/current_weather_usecase_impl.dart';

final getIt = GetIt.instance;

setUpProviders() {
  getIt.registerFactory<ICurrentWeatherUseCase>(() => CurrentWeatherUseCaseImpl(getIt()));
  getIt.registerFactory<CurrentWeatherUseCaseImpl>(
      () => CurrentWeatherUseCaseImpl(getIt()));
  getIt.registerFactory<ICurrentWeatherRepository>(
      () => ICurrentWeatherRepositoryImpl(getIt()));
  getIt.registerFactory<ICurrentWeatherDatasource>(
      () => CurrentWeatherDatasourceImplApi());
  getIt.registerLazySingleton<HomeController>(() => HomeController(getIt()));
}
