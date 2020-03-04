import 'package:flutter_app/models/transferencia.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return correct formatted string with toString method', (){
    var transferencia = Transferencia(220, 123);

    expect(transferencia.toString(), 'Transferencia{valor: 220.0, numeroConta: 123}');
  });

  test('Should return correct values from created object', (){
    var transferencia = Transferencia(220, 123);

    expect(transferencia.valor, 220);
    expect(transferencia.numeroConta, 123);
  });
}