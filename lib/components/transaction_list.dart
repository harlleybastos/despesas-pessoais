import 'package:despesasps/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        //Mostrar transações criadas em lista
        itemCount:
            transactions.length, //Quantidade de itens a serem renderizados
        itemBuilder: (ctx, index) {
          // Chama para renderizar de forma os elementos. Elementos necessários
          final tr = transactions[index];
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  )),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'R\$ ${tr.value.toStringAsFixed(2)}', //Interpolação com String
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tr.title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text(
                        DateFormat('d MMM y').format(tr.date), // Data formatada
                        style: TextStyle(
                          color: Colors.grey,
                        ))
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
