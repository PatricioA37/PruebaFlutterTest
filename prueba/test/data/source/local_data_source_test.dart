import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba/core/failures/failure.dart';
import 'package:prueba/data/source/local_data_source.dart';

import 'package:shared_preferences/shared_preferences.dart';



//import 'prueba/test/fixtures/dataCity.json'

class MockSharedPreferences extends Mock implements SharedPreferences {
  
}


void main() {
  late LocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;
  
  setUp(() {
    mockSharedPreferences = MockSharedPreferences(); //instanciar mock
    dataSource = LocalDataSourceImpl(sharedPreferences: mockSharedPreferences,);
    
  });


  group('Cityweather test', () {
      test('Get City Weather should return data', () async {
      const city = 'Chillan';
      const expectedReturn = 'Soleado';
      //Arrange
      when(mockSharedPreferences.getString(city))
        .thenAnswer((_) => ('Soleado'));
      //Act
      final result = await dataSource.getCityWeather(city);
      //Assert
      verify(mockSharedPreferences.getString(city)).called(1);
      expect(result, const Right(expectedReturn));
     });


      test('Get City Weather should return failure when sharedPreferences is called', () async {
      const city = 'Chillan';
      //Arrange
      when(mockSharedPreferences.getString(city))
        .thenThrow((_) => (RepositoryFailure()));
      //Act
      final result = await dataSource.getCityWeather(city);
      //Assert
      verify(mockSharedPreferences.getString(city)).called(1);
      expect(result,  Left(RepositoryFailure()));
      });
   });
  
  group('CurrentDate test', () { 
     test('Get Current Date should return data', () async {
    
    DateTime date = DateTime.now(); 
    String stringDate = date.toString();  
    //Arrange
    when(mockSharedPreferences.getString(stringDate)).thenAnswer((_) => stringDate);

    //Act
    final result = await dataSource.getCurrentDate(date);

    //Assert
    verify(mockSharedPreferences.getString(stringDate)).called(1);
    expect(result, Right(date));

    
  });

  test('Get CurrentDate should return failure when sharedPreferences is called', () async {
    DateTime date = DateTime.now(); 
    String stringDate = date.toString();  
    //Arrange
    
    when(mockSharedPreferences.getString(stringDate))
      .thenReturn("error");
    //Act
    final result = await dataSource.getCurrentDate(date);


    //Assert
    verify(mockSharedPreferences.getString(stringDate)).called(1);
    expect(result,  Left(RepositoryFailure()));

  });

  });


 

  
}
