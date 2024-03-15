import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

import 'package:prueba/core/platform/network_info.dart';
import 'package:prueba/data/repository/repository_impl.dart';
import 'package:prueba/data/source/local_data_source.dart';
import 'package:prueba/data/source/remote_data_source.dart';
import 'package:prueba/domain/repositories/repository.dart';



class MockRemoteDataSource extends Mock implements RemoteDataSource {}

class MockLocalDataSource extends Mock implements LocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo{}




void main(){
  //instanciar repositorio}
  
  MockLocalDataSource mockLocalDataSource = MockLocalDataSource();
  MockRemoteDataSource mockRemoteDataSource = MockRemoteDataSource();
  MockNetworkInfo mockNetworkInfo = MockNetworkInfo();
  Repository repositoryImpl = RepositoryImpl(localDataSource: mockLocalDataSource,remoteDataSource: mockRemoteDataSource,networkInfo: mockNetworkInfo);
  

  test('getCityWeather should return a value', () async {
    //arrange
    const String city = 'Chillan';

    when(mockLocalDataSource.getCityWeather(any))
      .thenAnswer((_) async => Future.value('Texto de prueba'));
        
    //act
    final result = await repositoryImpl.getCityWeather(city);

    //assert
    expect(result,const Right('Texto de prueba'));
  });

  test('getCurrentDate should return the date right now', () async {
    // arrange
    final currentDate = DateTime.now();
    
    when(mockLocalDataSource.getCurrentDate(currentDate))
      .thenAnswer((_) async => Future.value(currentDate));

    //act
    final result = await repositoryImpl.getCurrentDate(currentDate);

    // assert

    expect(result, Right(currentDate));
  });

  

  


}

