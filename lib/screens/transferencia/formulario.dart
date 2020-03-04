import 'package:flutter/material.dart';
import 'package:flutter_app/components/editor.dart';
import 'package:flutter_app/models/transferencia.dart';

const _tituloAppBar = 'Criando transferência';
const _rotulo = 'Número da conta';
const _rotuloDica = '0000';
const _valor = 'Valor';
const _valorDica = '0.00';
const _confirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorNumeroConta,
                rotulo: _rotulo,
                dica: _rotuloDica),
            Editor(
                controlador: _controladorValor,
                icone: Icons.monetization_on,
                rotulo: _valor,
                dica: _valorDica),
            RaisedButton(
                onPressed: () => _criaTransferencia(context),
                child: Text(_confirmar))
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorNumeroConta.text);
    final double valor = double.tryParse(_controladorValor.text);
    if (numeroConta != null && valor != null) {
      Navigator.pop(context, Transferencia(valor, numeroConta));
    }
  }
}
