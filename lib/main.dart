import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }

}

class FormularioTransferencia extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando transferência'),
      ),
      body: Text('Teste'),
    );
  }

}

class ListaTransferencia extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
        leading: Icon(
            Icons.attach_money
        ),
      ),
      body: Column(
        children: <Widget>[
          ItemTranferencia(Tranferencia(100, 1000)),
          ItemTranferencia(Tranferencia(200, 1001)),
          ItemTranferencia(Tranferencia(300, 1002)),
          ItemTranferencia(Tranferencia(400, 1003)),
          ItemTranferencia(Tranferencia(500, 1004))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            Icons.add
        ),
      ),
    );
  }

}

class ItemTranferencia extends StatelessWidget {

  final Tranferencia _tranferencia;

  ItemTranferencia(this._tranferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(
              Icons.monetization_on
          ),
          title: Text('RS ' + _tranferencia.valor.toString()),
          subtitle: Text('Conta ' + _tranferencia.numeroConta.toString()),
        )
    );
  }

}

class Tranferencia {

  final double valor;
  final int numeroConta;

  Tranferencia(this.valor, this.numeroConta);

}