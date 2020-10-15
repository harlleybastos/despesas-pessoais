import 'package:despesasps/components/chart.dart';
import 'package:despesasps/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/transaction_list.dart';
import 'components/transaction_form.dart';
import 'components/chart.dart';
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
        textTheme: ThemeData.light().textTheme.copyWith(
            // Alterando fonte do titulo do card
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            button: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        appBarTheme: AppBarTheme(
          // Alterando fonte do nome do app
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
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    //Filtrar somente as transações recentes
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop(); // Fechando Modal apos completar adição
  }

  _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
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
            Chart(_recentTransactions),
            TransactionList(_transactions, _deleteTransaction),
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
