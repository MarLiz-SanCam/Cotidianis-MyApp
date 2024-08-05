import 'package:cotidianis_myapp/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

List<String> titles = <String>[
  'Notes',
  'Lists',
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
    const int tabsCount = 4;
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
                icon: const Icon(Icons.list_alt_rounded),
                text: titles[1],
              ),
              Tab(
                icon: const Icon(Icons.calendar_month_rounded),
                text: titles[2],
              ),
              Tab(
                icon: const Icon(Icons.inventory_rounded),
                text: titles[3],
              )
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
                  title: Text('MyLists'),
                );
              },
            ),
            ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return const ListTile(
                  title: Text('Calendar'),
                );
              },
            ),
            ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return const ListTile(
                  title: Text('Notes'),
                );
              },
            ),
            ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return const ListTile(
                  title: Text('Notes'),
                );
              },
            ),
          ],
        ),
      ),
    );
    /*
      appBar: AppBar(
          backgroundColor: colors.accentuated,
          title: Text(widget.title),
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: const Icon(Icons.cloud_outlined),
                text: 'Notes',
              ),
              Tab(
                icon: const Icon(Icons.beach_access_sharp),
                text: 'My lists',
              ),
              Tab(
                icon: const Icon(Icons.brightness_5_sharp),
                text: 'Calendar',
              ),
            ],
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          )),
      body: TabBarView(
        children: <Widget>[
          ListView.builder(
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                tileColor: colors.accentuated,
                title: Text('MyLists'),
              );
            },
          ),
          ListView.builder(
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                tileColor: colors.accentuated,
                title: Text('Calendar'),
              );
            },
          ),
          ListView.builder(
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                tileColor: colors.accentuated,
                title: Text('Notes'),
              );
            },
          ),
        ],
      ),
      /*child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'TODO: Buttons goes here',
              //T: put the buttons in here
            ),
            Text(
              ':)',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),*/
    );
    floatingActionButton: FloatingActionButton(
        //onPressed:
        tooltip: 'Create',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.*/
  }
}
