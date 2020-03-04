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
  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando transferência'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorNumeroConta,
              decoration: InputDecoration(
                  labelText: 'Número da conta', hintText: '0000'),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorValor,
              decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Valor',
                  hintText: '0.00'),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          RaisedButton(
              onPressed: () {
                final int numerConta =
                    int.tryParse(_controladorNumeroConta.text);
                final double valor = double.tryParse(_controladorValor.text);
                if (numerConta != null && valor != null) {
                  final transferenciaCriada = Transferencia(valor, numerConta);
                   debugPrint('$transferenciaCriada');
                }
              },
              child: Text('Confirmar'))
        ],
      ),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
        leading: Icon(Icons.attach_money),
      ),
      body: Column(
        children: <Widget>[
          ItemTranferencia(Transferencia(100, 1000)),
          ItemTranferencia(Transferencia(200, 1001)),
          ItemTranferencia(Transferencia(300, 1002)),
          ItemTranferencia(Transferencia(400, 1003)),
          ItemTranferencia(Transferencia(500, 1004))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTranferencia extends StatelessWidget {
  final Transferencia _tranferencia;

  ItemTranferencia(this._tranferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text('RS ' + _tranferencia.valor.toString()),
      subtitle: Text('Conta ' + _tranferencia.numeroConta.toString()),
    ));
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }

}
