import 'package:dartz/dartz.dart';
import 'package:prueba/core/failures/failure.dart';
import 'package:prueba/core/usecase/usecase.dart';
import 'package:prueba/domain/repositories/repository.dart';

class GetCityDateUseCase implements UseCase<DateTime, CityParamsDate> {
  final Repository repository;

  GetCityDateUseCase(this.repository);

  @override
  Future<Either<Failure, DateTime>> call(params) async {
    return repository.getCurrentDate(params.date);
  }
}

class CityParamsDate {
  final DateTime date;

  CityParamsDate(this.date);
}