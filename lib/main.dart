import 'package:cotidianis_myapp/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

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
            accentuated: Color(0xff773344),
            overlay: Color(0xffe3b5a4),
            hint: Color(0xfff5e9e2))
      ]),
      darkTheme: ThemeData.dark().copyWith(extensions: const [
        AppColors(
            accentuated: Color(0xff471f29),
            overlay: Color(0xffd89a83),
            hint: Color(0xFfefdcd1))
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
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 15.0,
          shadowColor: colors.hint,
          titleTextStyle: TextStyle(color: colors.hint, fontSize: 15),
          bottom: TabBar(
            labelColor:
                colors.overlay, // Cambia el color del título seleccionado
            unselectedLabelColor: colors.hint,
            indicatorColor:
                colors.overlay, // Cambia el color del título no seleccionado
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
          /*leading:
              const Image(image: AssetImage('assets/images/cotidianis.png')),*/
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
            Stack(
              children: [
                SfCalendar(
                  todayHighlightColor: colors.accentuated,
                  todayTextStyle: TextStyle(color: colors.hint),
                  headerStyle: CalendarHeaderStyle(
                    backgroundColor:
                        colors.hint, // Color de fondo de la barra de mes y año
                    textStyle: const TextStyle(
                      // Color del texto del mes y año
                      fontSize: 20, // Tamaño de fuente del texto del mes y año
                    ),
                  ),
                ),
                //TODO: Cambiar el boton por una funcion adecuada para agregar eventos
                Positioned(
                    bottom:
                        20, // Cambia este valor para ajustar la posición vertical
                    right: 20,
                    child: FloatingActionButton(
                      backgroundColor: colors.accentuated,
                      foregroundColor: colors.hint,
                      shape: const CircleBorder(),
                      onPressed: () {
                        const snackBar = SnackBar(
                          content: Text('Button working'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: const Icon(Icons.add),
                    ))
              ],
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
