import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class RepositoryFailure extends Failure {}

class LocalDataSourceFailure extends Failure {}
