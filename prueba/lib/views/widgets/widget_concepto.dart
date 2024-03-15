import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:prueba/data/repository/repository_impl.dart';
import 'package:prueba/data/source/local_data_source.dart';
import 'package:prueba/domain/entities/local_data.dart';
import 'package:prueba/domain/usecase/get_city_weather_usecase.dart';
import 'package:prueba/presentation/bloc/local_data_bloc.dart';

class Concepto extends StatelessWidget {
  const Concepto({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final httpClient = Client();
    final localDataSource = LocalDataSourceImpl(httpClient: httpClient);
    final repository = RepositoryImpl(localDataSource: localDataSource);
    final cityUseCase = GetCityWeatherUseCase(repository);
    final localDataBloc = LocalDataBloc(cityUseCase: cityUseCase);

    TextEditingController inputController = TextEditingController();

    return BlocProvider(
      create: (context) => localDataBloc,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Clima",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 250),
                    child: TextField(
                      controller: inputController,
                      decoration: const InputDecoration(
                        filled: true,
                        contentPadding: EdgeInsets.all(15),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(12),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Introduzca una ciudad',
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () async {
                      String userInput = inputController.text;

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('You clicked ElevatedButton. $userInput')));
                    },
                    child: const Text('Buscar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildLoadedState(LocalData data) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'City: ${data.city}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Text(
        'Error: $message',
        style: const TextStyle(color: Colors.red),
      ),
    );
  }

  Widget _buildInitialState() {
    return const Center(
      child: Text('Esperando datos...'),
    );
  }

