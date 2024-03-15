import 'package:dartz/dartz.dart';
import 'package:prueba/core/failures/failure.dart';
import 'package:prueba/domain/entities/local_data.dart';

abstract class Repository {
  Future<Either<Failure, LocalData>> getCityWeather(String city);  
}
