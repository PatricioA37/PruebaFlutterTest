import 'package:flutter_test/flutter_test.dart';
import 'package:prueba/main.dart';

void main() {
  group('Dato Tests', () {
    test('copia de dato', () {
      // Arrange
      final datoOriginal = Dato(ciudad: 'Chillan', fecha: DateTime.now(), temperatura: 31);

      // Act
      final datoCopia = datoOriginal.copia();

      // Assert
      expect(datoCopia.ciudad, 'Chillan');
      expect(datoCopia.fecha, datoOriginal.fecha); 
      expect(datoCopia.temperatura, datoOriginal.temperatura);
    });

    
  });
}