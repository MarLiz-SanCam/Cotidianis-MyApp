import 'package:cotidianis_myapp/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
    var colors = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.accentuated,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'TODO: Buttons goes here',
              //TODO: put the buttons in here
            ),
            Text(
              ':)',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        //onPressed:
        tooltip: 'Create',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.*/
    );
  }
}
