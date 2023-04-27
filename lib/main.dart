import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: Conversor(),
    debugShowCheckedModeBanner: false,
  ));
}

class Conversor extends StatefulWidget {
  @override
  _ConversorMoedasState createState() => _ConversorMoedasState();
}

class _ConversorMoedasState extends State<Conversor> {
  double? valorEmReais;
  double? valorEmDolar;
  double? valorEmEuro;

  final realController = TextEditingController();

  void _realChanged(String text) {
    if (text.isEmpty) {
      _limparCampos();
      return;
    }
    double real = double.parse(text);
    setState(() {
      valorEmReais = real;
      valorEmDolar = real / 5.05;
      valorEmEuro = real / 5.60;
    });
  }

  void _limparCampos() {
    realController.text = "";
    valorEmReais = null;
    valorEmDolar = null;
    valorEmEuro = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MoneyConv"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.monetization_on,
              size: 150.0,
              color: Colors.green,
            ),
            TextField(
              controller: realController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Real",
                labelStyle: TextStyle(color: Colors.green),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(
                color: Colors.green,
                fontSize: 25.0,
              ),
              onChanged: _realChanged,
            ),
            Divider(),
            Text(
              valorEmDolar != null
                  ? "Dólar: ${valorEmDolar!.toStringAsFixed(2)}"
                  : "",
              style: TextStyle(
                color: Colors.green,
                fontSize: 25.0,
              ),
              textAlign: TextAlign.center,
            ),
            Divider(),
            Text(
              valorEmEuro != null
                  ? "Euro: ${valorEmEuro!.toStringAsFixed(2)}"
                  : "",
              style: TextStyle(
                color: Colors.green,
                fontSize: 25.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}