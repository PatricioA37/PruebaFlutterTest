import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Dato {
  final String ciudad;
  final DateTime fecha;
  final int temperatura;

  Dato({required this.ciudad, required this.fecha, required this.temperatura});

  // Método copia para realizar la copia del objeto
  Dato copia({String? ciudad, DateTime? fecha, int? temperatura}) {
    return Dato(
      ciudad: ciudad ?? this.ciudad,
      fecha: fecha ?? this.fecha,
      temperatura: temperatura ?? this.temperatura,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperatura',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tabla de Datos'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyDataTable(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Lógica para copiar el objeto usando copia
                  final Dato datoOriginal = Dato(
                    ciudad: 'Chillan',
                    fecha: DateTime.now(),
                    temperatura: 31,
                  );

                  final Dato copia = datoOriginal.copia(
                    ciudad: 'Otra Ciudad',
                    temperatura: 25,
                  );

                  print('Copia del dato original: $copia');
                },
                child: const Text('Copiar Objeto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyDataTable extends StatelessWidget {
  const MyDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Ciudad')),
        DataColumn(label: Text('Fecha')),
        DataColumn(label: Text('Temperatura')),
      ],
      rows: const [
        DataRow(cells: [
          DataCell(Text('Chillan')),
          DataCell(Text('19/01/2024')),
          DataCell(Text('31')),
        ]),
      ],
    );
  }
}
