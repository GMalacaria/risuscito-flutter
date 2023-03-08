import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resuscito/pages/drawer.dart';
import 'package:resuscito/globals-states.dart' as globals;
import 'package:resuscito/pages/home.dart';
import 'package:resuscito/pages/indici-canti.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Risuscitò',
      theme: ThemeData(
        backgroundColor: Colors.white,
        // primarySwatch: materialColor
      ),
      home: const MainPage(title: ''),
      routes: {
        '/homepage': (context) => Homepage(),
        '/indici-canti': (context) {
          globals.pagina_selezionata = 'Home page';
          return const IndiciCanti();
        }
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: Builder(
          builder: (context) => // Ensure Scaffold is in context
              IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () => Scaffold.of(context).openDrawer()),
        ),

        title: Text(globals.pagina_selezionata,
            style: const TextStyle(color: Colors.black)),
        systemOverlayStyle:
            SystemUiOverlayStyle.dark, // TODO i,nserire pagina_selezionata
      ),
      drawerEnableOpenDragGesture: false,
      drawer: const MyDrawer(),
      /* Drawer(
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
                color: pagina_selezionata == 'impostazioni'
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
                    pagina_selezionata = 'impostazioni';
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
                color: pagina_selezionata == 'about' ? colorSelezionato : null,
                borderRadius: BorderRadius.circular(50),
              ),
              child: ListTile(
                key: const Key('cont-tile-about'),
                leading: const Icon(Icons.info_outline_rounded),
                title: const Text('About'),
                onTap: () {
                  setState(() {
                    pagina_selezionata = 'about';
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
      ),
       */ // Center is a layout widget. It takes a single child and positions it
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
