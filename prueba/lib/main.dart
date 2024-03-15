import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba/data/repository/repository_impl.dart';
import 'package:prueba/data/source/local_data_source.dart';
import 'package:prueba/domain/repositories/repository.dart';
import 'package:prueba/domain/usecase/get_city_weather_usecase.dart';
import 'package:prueba/presentation/bloc/local_data_bloc.dart';
import 'package:prueba/views/pages/home_page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  
  @override
  Widget build(BuildContext context) {
    LocalDataSource dataSource = LocalDataSourceImpl();
    Repository fileRepositoryImpl = RepositoryImpl(localDataSource: dataSource);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocalDataBloc(cityUseCase: GetCityWeatherUseCase(fileRepositoryImpl)),
        ),
      ],
      child: const MaterialApp(
        title: 'Clima',
        home: Scaffold(
          body: HomePage(),
        ),
      ),
    );
    
}


}