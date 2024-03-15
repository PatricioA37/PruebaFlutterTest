import 'package:prueba/core/failures/failure.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:prueba/domain/entities/local_data.dart';
import 'package:prueba/presentation/bloc/local_data_event.dart';
import 'package:prueba/presentation/bloc/local_data_state.dart';

import '../../domain/usecase/get_city_weather_usecase.dart';


class LocalDataBloc extends Bloc <LocalDataEvent, LocalDataState> {
  final GetCityWeatherUseCase getCityWeatherUseCase;

 // final InputConverter inputConverter;
  
  LocalDataBloc({
    required GetCityWeatherUseCase cityUseCase
  })  : getCityWeatherUseCase = cityUseCase,
        super(Empty()){
          on<LocalDataEvent>((event,emit) async {
            emit(Loading());

            Either<Failure, LocalData> responseEither = await getCityWeatherUseCase(CityParams(city: event.city));

            responseEither.fold(
              (error) => emit(Error(message: error.toString())),
              (success) => emit(Loaded(data: success))
              );          
          });
        }
}
