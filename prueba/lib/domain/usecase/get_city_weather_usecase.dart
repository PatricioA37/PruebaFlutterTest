import 'package:dartz/dartz.dart';

import 'package:prueba/core/failures/failure.dart';

import '../../core/usecase/usecase.dart';
import '../repositories/repository.dart';

class GetCityWeatherUseCase implements UseCase<String, CityParams> {
  final Repository repository;

  GetCityWeatherUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(params) async {
    return repository.getCityWeather(params.city);
  }
}

class CityParams {
  final String city;

  CityParams(this.city);
}
