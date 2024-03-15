import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:prueba/core/failures/failure.dart';

import 'package:prueba/domain/entities/local_data.dart';

import '../../core/usecase/usecase.dart';
import '../repositories/repository.dart';

class GetCityWeatherUseCase implements UseCase<LocalData, CityParams> {
  final Repository repository;

  GetCityWeatherUseCase(this.repository);

  @override
  Future<Either<Failure, LocalData>> call(params) async {
    return await repository.getCityWeather(params.city);
  }
}

class CityParams extends Equatable{
  final String city;

  const CityParams({required this.city});

   @override
  List<Object> get props => [city];
}
