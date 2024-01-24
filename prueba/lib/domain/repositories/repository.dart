import 'package:dartz/dartz.dart';
import 'package:prueba/core/failures/failure.dart';

abstract class Repository {
  Future<Either<Failure, String>> getCityWeather(String city);
  Future<Either<Failure, DateTime>> getCurrentDate(DateTime date);
}
