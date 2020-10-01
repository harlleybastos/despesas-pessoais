import 'package:despesasps/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/transaction_list.dart';
import 'components/transaction_form.dart';
import 'models/transaction.dart';

main() => runApp(DespesasPessoais());

//Classe principal
class DespesasPessoais extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(), // Instancia da página principal home
      theme: ThemeData(
        primarySwatch: Colors.purple, // Cor principal com material color
        accentColor: Colors.amber, // Cor de realce do botão
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith( // Alterando fonte do titulo do card
          title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
        ),
        appBarTheme: AppBarTheme( // Alterando fonte do nome do app
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

//Classe criada para instanciar o texto central
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transactions = [
    //Lista com modelo de Transações
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de #01',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop(); // Fechando Modal apos completar adição
  }

  _opentransactionFormModal(BuildContext context) {
    // Abrindo modal
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _opentransactionFormModal(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // Column recebe um conjunto de elementos
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Eixo de baixo para o lado
          children: <Widget>[
            // Lista
            Container(
              //Container que envolve toda a parte superior
              child: Card(
                color: Colors.blue,
                child: Text('Gráfico'),
                elevation: 5, //Ideia de elemento 3D
              ),
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //Botão de +
        child: Icon(Icons.add),
        onPressed: () => _opentransactionFormModal(context),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, // Centralizando botão
    );
  }
}
