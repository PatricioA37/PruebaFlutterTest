import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:prueba/domain/entities/local_data.dart';


@immutable
abstract class LocalDataState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends LocalDataState {}

class Loading extends LocalDataState {}

class Loaded extends LocalDataState {
  final LocalData data;

  Loaded({required this.data});

  @override
  List<Object> get props => [data];
}

class Error extends LocalDataState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
  