library globals_states.globals;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resuscito/class/page.dart';
import 'package:resuscito/pages/canti-consegnati.dart';
import 'package:resuscito/pages/cronologia.dart';
import 'package:resuscito/pages/home.dart';
import 'package:resuscito/pages/indici-canti.dart';
import 'package:resuscito/pages/liste-personalizzate.dart';
import 'package:resuscito/pages/preferiti.dart';

// ignore: non_constant_identifier_names
String pagina_selezionata = 'Home page';

List<Pagina> listaPagine = [
  Pagina('Home page', const Icon(Icons.home), 'homepage', 1, const Homepage()),
  Pagina('Indici dei canti', const Icon(Icons.format_list_bulleted_outlined),
      'indici-canti', 2, IndiciCanti()),
  Pagina('Liste personalizzate', const Icon(Icons.view_carousel_outlined),
      'liste-personalizzate', 3, ListepPersonalizzate()),
  Pagina('Preferiti', const Icon(Icons.bookmarks_outlined), 'preferiti', 4,
      Preferiti()),
  Pagina('Canti consegnati', const Icon(Icons.fact_check_outlined),
      'canti-consegnati', 5, const CantiConsegnati()),
  Pagina('Cronologia', const Icon(Icons.restore), 'cronologia', 6,
      const Cronologia())
];
