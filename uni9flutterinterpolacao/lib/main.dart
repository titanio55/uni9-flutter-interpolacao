import 'package:flutter/material.dart';

void main() {
  runApp(MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaInicial(),
    );
  }
}

class TelaInicial extends StatefulWidget {


  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  String nome = '';
  bool? maria = false;
  bool? jose = false;
  bool? joao = false;
  int count = 0;

  String get periodo {
    var hora = DateTime.now().hour;
    if (hora < 12) {
      return 'Bom dia';
    }
    if (hora < 18) {
      return 'Boa tarde';
    }
    return 'Boa noite';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meu Aplicativo')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (text) {
                setState(() {
                  nome = text;
                });
              },
              decoration: InputDecoration(
                labelText: 'Digite seu nome',
              ),
            ),
            Text('Olá, $nome. $periodo'),
            CheckboxListTile(
                title: Text('Maria'),
                value: maria,
                onChanged: (newValue) {
                  setState(() {
                    maria = newValue!;
                    count = (newValue ?? false) ? count+1 : count-1;
                  });
                }),
            CheckboxListTile(
                title: Text('José'),
                value: jose,
                onChanged: (newValue) {
                  setState(() {
                    jose = newValue;
                    count = (jose ?? false) ? count+1 : count-1;
                  });
                }),
            CheckboxListTile(
                title: Text('João'),
                value: joao,
                onChanged: (newValue) {
                  setState(() {
                    joao = newValue;
                    count = (joao ?? false) ? count+1 : count-1;
                  });
                }),
            Text('$count de 3 licenças atribuidas'),
          ],
        ),
      ),
    );
  }
}