import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class LocalData extends Equatable {
  final String city;

  const LocalData({
    required this.city,
  });

  @override
  List<Object> get props => [city];
}
