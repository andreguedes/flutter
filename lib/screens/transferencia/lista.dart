import 'package:flutter/material.dart';
import 'package:flutter_app/models/transferencia.dart';
import 'package:flutter_app/screens/transferencia/formulario.dart';

const _tituloAppBar = 'Transferências';
const _cifrao = 'RS ';
const _conta = 'Conta ';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
        leading: Icon(Icons.attach_money),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then((transferenciaRecebida) => _atualiza(transferenciaRecebida));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida) {
    setState(() {
      if (transferenciaRecebida != null)
        widget._transferencias.add(transferenciaRecebida);
    });
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _tranferencia;

  ItemTransferencia(this._tranferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_cifrao + _tranferencia.valor.toString()),
      subtitle: Text(_conta + _tranferencia.numeroConta.toString()),
    ));
  }
}
