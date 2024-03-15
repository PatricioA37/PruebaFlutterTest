import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class LocalDataEvent extends Equatable {
  final String city;

  const LocalDataEvent(this.city);

  @override
  List<Object> get props => [city];
}
