import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:prueba/data/model/local_data_source_model.dart';
import 'package:prueba/domain/entities/local_data.dart';

import '../../fixtures/fixture_reader.dart';


void main() {
  final tLocalDataModel = LocalData();
  
  
  group('fromJson', () {
    test(
      'should return a valid model when the JSON city is an String',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('dataCity.json'));
        // act
        final result = LocalData.fromJson(jsonMap);
        // assert
        expect(result, tLocalDataModel);
      },
    );

    test(
      'should return a valid model when the JSON date is regarded as a date',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('dataCity.json'));
        // act
        final result = LocalData.fromJson(jsonMap);
        // assert
        expect(result, tLocalDataModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tLocalDataModel.toJson();
        // assert
        final expectedMap = {
          "city": "Test Text",
          "date": "",
        };
        expect(result, expectedMap);
      },
    );
  });

}