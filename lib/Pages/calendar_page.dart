import 'package:cotidianis_myapp/Design/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarTab extends StatefulWidget {
  const CalendarTab({super.key});

  @override
  CalendarTabState createState() => CalendarTabState();
}

class CalendarTabState extends State<CalendarTab> {
  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).extension<AppColors>()!;
    return Stack(
      children: [
        SfCalendar(
          todayHighlightColor: colors.accentuated,
          todayTextStyle: TextStyle(color: colors.hint),
          headerStyle: CalendarHeaderStyle(
            backgroundColor:
                colors.hint, // Color de fondo de la barra de mes y año
            textStyle: const TextStyle(
              color: Color(0xff773344),
              // Color del texto del mes y año
              fontSize: 20, // Tamaño de fuente del texto del mes y año
            ),
          ),
        ),
        //TODO: Cambiar el boton por una funcion adecuada para agregar eventos
        Positioned(
            bottom: 20, // Cambia este valor para ajustar la posición vertical
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
    );
  }
}
