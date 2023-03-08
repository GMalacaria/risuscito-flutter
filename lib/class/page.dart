import 'package:flutter/material.dart';
import 'package:resuscito/pages/home.dart';

class Pagina {
  String nome = '';
  Icon icona = const Icon(
    Icons.home,
  );
  String navigazione = '';
  int indice = 0;
  Widget pag = const Homepage();

  Pagina(
    this.nome,
    this.icona,
    this.navigazione,
    this.indice,
    pag,
  );

  Map<String, dynamic> transformaInMap() {
    return {
      'nome': nome,
      'icona': icona,
      'navigazione': navigazione,
      'indice': indice,
      'pag': pag,
    };
  }

  Pagina.daMap(Map<String, dynamic> map) {
    nome = map['nome'];
    icona = map['icona'];
    navigazione = map['navigazione'];
    indice = map['indice'];
    pag = map['pag'];
  }
}
