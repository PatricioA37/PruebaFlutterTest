import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba/presentation/bloc/local_data_bloc.dart';
import 'package:prueba/presentation/bloc/local_data_state.dart';
import 'package:prueba/domain/entities/local_data.dart';

class WeatherScreen extends StatelessWidget {
  
  const WeatherScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Weather Details'),
      ),
      body: BlocBuilder<LocalDataBloc, LocalDataState>(
        builder: (context, state) {
          if (state is Loading) {
            return _buildLoadingState();
          } else if (state is Loaded) {
            return _buildLoadedState(state.data);
          } else if (state is Error) {
            return _buildErrorState(state.message);
          } else {
            return _buildInitialState();
          }
        },
      ),
    );
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
}
