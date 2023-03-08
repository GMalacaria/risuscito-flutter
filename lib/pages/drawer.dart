import 'package:flutter/material.dart';
import 'package:resuscito/class/page.dart';
import 'package:resuscito/globals-states.dart' as globals;
import 'package:resuscito/pages/canti-consegnati.dart';
import 'package:resuscito/pages/cronologia.dart';
import 'package:resuscito/pages/home.dart';
import 'package:resuscito/pages/indici-canti.dart';
import 'package:resuscito/pages/liste-personalizzate.dart';
import 'package:resuscito/pages/preferiti.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

// drawer dell'app, creazione dinamico
// necessario utilizzare un cambio globals.pagina_selezionata tramite gestione degli stati dell app

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final fontSize =
        screenHeight * 0.03; // il titolo del drawer è leggermente più grande

    const colorSelezionato =
        Color.fromRGBO(207, 219, 229, 10); // TODO rimediare colore corretto

    var listTilesUP = [];
    List<Pagina> listPages = globals.listaPagine;

    for (var pag in listPages) {
      listTilesUP.add(
        Container(
          key: Key('cont-' + pag.nome),
          decoration: BoxDecoration(
            color: globals.pagina_selezionata == pag.nome
                ? colorSelezionato
                : null,
            borderRadius: BorderRadius.circular(50),
          ),
          child: ListTile(
            key: Key('cont-tile-' + pag.nome),
            leading: pag.icona,
            title: Text(pag.nome),
            onTap: () {
              setState(() {
                globals.pagina_selezionata = pag.nome;
              });
              Navigator.of(context).pushNamed('/' + pag.navigazione);
            },
            minLeadingWidth: 10,
          ),
        ),
      );
    }

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      key: UniqueKey(),
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        // Important: Remove any padding from the ListView.
        children: [
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(16, 20, 0, 0),
            //  decoration: Decoration(),
            // decoration: BoxDecoration(),
            title: Text(
              'Risuscitò',
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          ),
          ...listTilesUP,
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: const Divider(
              color: Colors.black,
              height: 1,
            ),
          ),
          Container(
            key: const Key('cont-impostazioni'),
            decoration: BoxDecoration(
              color: globals.pagina_selezionata == 'impostazioni'
                  ? colorSelezionato
                  : null,
              borderRadius: BorderRadius.circular(50),
            ),
            child: ListTile(
              key: const Key('cont-tile-impostazioni'),
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Impostazioni'),
              onTap: () {
                setState(() {
                  globals.pagina_selezionata = 'impostazioni';
                });
                // Update the state of the app
                // ...
                // Then close the drawer
              },
              minLeadingWidth: 10,
            ),
          ),
          Container(
            key: const Key('cont-about'),
            decoration: BoxDecoration(
              color: globals.pagina_selezionata == 'about'
                  ? colorSelezionato
                  : null,
              borderRadius: BorderRadius.circular(50),
            ),
            child: ListTile(
              key: const Key('cont-tile-about'),
              leading: const Icon(Icons.info_outline_rounded),
              title: const Text('About'),
              onTap: () {
                setState(() {
                  globals.pagina_selezionata = 'about';
                });
                // Update the state of the app
                // ...
                // Then close the drawer
                //     Navigator.pop(context);
              },
              minLeadingWidth: 10,
            ),
          ),
        ],
      ),
    );
  }
}
