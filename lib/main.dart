import 'package:cotidianis_myapp/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

List<String> titles = <String>[
  'Notes',
  'Lists',
  'Finances',
  'Calendar',
  'Inventory',
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cotidianis My App',
      theme: ThemeData.light().copyWith(extensions: const [
        AppColors(
            accentuated: Color(0xff91c2f3),
            overlay: Color(0xffEDF5FD),
            hint: Color(0x7EFFFFFF))
      ]),
      darkTheme: ThemeData.dark().copyWith(extensions: const [
        AppColors(
            accentuated: Color(0xff1c68B0),
            overlay: Color(0xff39383a),
            hint: Color(0xFf6a747c))
      ]),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'COTIDIANIS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //Colors
    var colors = Theme.of(context).extension<AppColors>()!;
    const int tabsCount = 5;
    return DefaultTabController(
      initialIndex: 0,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colors.accentuated,
          title: Text(widget.title),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: const Icon(Icons.library_books_rounded),
                text: titles[0],
              ),
              Tab(
                icon: const Icon(Icons.library_books_rounded),
                text: titles[1],
              ),
              Tab(
                icon: const Icon(Icons.attach_money_sharp),
                text: titles[2],
              ),
              Tab(
                icon: const Icon(Icons.calendar_month_rounded),
                text: titles[3],
              ),
              Tab(
                icon: const Icon(Icons.list_alt_rounded),
                text: titles[4],
              ),
            ],
          ),
          leading:
              const Image(image: AssetImage('assets/images/cotidianis.png')),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return const ListTile(
                  title: Text('Notas aqui en forma de mosaico'),
                );
              },
            ),
            ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return const ListTile(
                  title: Text('Listas de compras y otros'),
                );
              },
            ),
            ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return const ListTile(
                  title: Text('Calendario y agenda'),
                );
              },
            ),
            ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return const ListTile(
                  title: Text('Inventario de hogar'),
                );
              },
            ),
            ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return const ListTile(
                  title: Text('Finanzas'),
                );
              },
            ),
          ],
        ),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.*/
  }
}
