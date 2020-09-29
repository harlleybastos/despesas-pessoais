import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;


  Transaction({ //Construtor com atributos nomeados
    @required this.id, // Atributos obrigatórios 
    @required this.title,
    @required this.value,
    @required this.date

  });
}