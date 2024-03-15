import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba/core/usecase/usecase.dart';
import 'package:prueba/domain/repositories/repository.dart';
import 'package:prueba/domain/usecase/get_date_city_usecase.dart';

import 'get_date_city_usecase_test.mocks.dart';

@GenerateMocks([Repository])
void main() {
  MockRepository mockRepository = MockRepository();
  GetCityDateUseCase getDateUseCase = GetCityDateUseCase(mockRepository);

  test('GetCityDateUseCase is a UseCase instance', () {
    //assert
    expect(getDateUseCase, isA<UseCase>());
  });


  test('should return a Right<DateTime> with the current date', () async {
    // arrange
    final currentDate = DateTime.now();
    when(mockRepository.getCurrentDate(any))
        .thenAnswer((_) async => Right(currentDate));

    // act
    final result = await getDateUseCase(CityParamsDate(currentDate));

    // assert
    verify(mockRepository.getCurrentDate(currentDate));
    expect(result, Right(currentDate));
  });
}
