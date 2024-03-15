
import 'package:dartz/dartz.dart';
import 'package:prueba/core/failures/failure.dart';
import 'package:prueba/data/model/local_data_model.dart';
import 'package:prueba/data/source/local_data_source.dart';
import 'package:prueba/domain/repositories/repository.dart';


class RepositoryImpl implements Repository{

  final LocalDataSource localDataSource;
  
  RepositoryImpl ({
    required this.localDataSource
  });

  @override
  Future<Either<Failure, LocalDataModel>> getCityWeather(String city) async {
    try {
      LocalDataModel response = LocalDataModel(city: await localDataSource.getCityWeather(city));
      return right(response);
    } catch (e) {
      return left(RepositoryFailure());
    }
  }
 }
