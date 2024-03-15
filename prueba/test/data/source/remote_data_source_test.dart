import 'dart:html';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:prueba/data/source/remote_data_source.dart';

import '../../fixtures/fixture_reader.dart';



class MockHttpClient extends Mock implements http.Client {}

void main() {
  RemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = RemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(fixture('dataCity.json'), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group('getcityweather', () {
    final String city = 'chillan';
    final Tlocal_data_source_model = local_data_source_model.fromJson(json.decode(fixture('dataCity.json')));
  
    test('''Should perform a get request on a URL 
        whit city beign the endpoint and whit application/json header''', 
        () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        dataSource.getCityWeather(city);
        // assert
        verify(mockHttpClient.get(
          '',
          headers: {  
            'Content-Type': 'application/json',
          },
        ));
      },
      );
   });

  group('get current date city', () { });

  testWidgets('remote data source ...', (tester) async {


    
  });
}