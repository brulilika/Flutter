import 'package:flutter/material.dart';
import 'package:persistencia/models/Contato.dart';

class NovoContato extends StatelessWidget {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _contaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Novo contato'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(7.5),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextField(
                    controller: _nomeController,
                    decoration: InputDecoration(labelText: 'Usuário'),
                  )),
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextField(
                    controller: _contaController,
                    decoration: InputDecoration(labelText: 'Conta'),
                    keyboardType: TextInputType.number,
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          final String name = _nomeController.text;
                          final String conta = _contaController.text;
                          final Contato novoContato = Contato(0, name, conta);
                          Navigator.of(context).pop();
                        },
                        child: Text('Cadastrar')),
                  )),
            ],
          ),
        ));
  }
}
