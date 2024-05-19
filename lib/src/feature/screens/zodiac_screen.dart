import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_health_app/src/feature/widgets/my_health_app_drawer.dart';

// calcula y muestra el signo zodiacal basado en la fecha seleccionada

class ZodiacScreen extends StatefulWidget {
  @override
  _ZodiacScreenState createState() => _ZodiacScreenState();
}

class _ZodiacScreenState extends State<ZodiacScreen> {
  final TextEditingController _nameController = TextEditingController(); // Controlador para el campo de texto del nombre
  DateTime? _selectedDate; // Fecha seleccionada por el usuario
  String? _zodiacSign;     // Signo del zodiaco calculado a partir de la fecha seleccionada 

 // Método para mostrar el selector de fecha
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),  // Fecha inicial es la fecha actual
      firstDate: DateTime(1900),   // La fecha más antigua que se puede seleccionar es 1900
      lastDate: DateTime.now(),    // La fecha más reciente que se puede seleccionar es la fecha actual
    ).then((pickedDate) {
      if (pickedDate == null) return;  // Si no se selecciona ninguna fecha, no hacemos nada
      setState(() {                    // Actualizamos el estado de la aplicación
        _selectedDate = pickedDate;    // Guardamos la fecha seleccionada
        _zodiacSign = _determineZodiacSign(pickedDate); // Alamecena el signo del zodiaco a partir de la fecha seleccionada
      });
    });
  }

  // Método para determinar el signo del zodiaco a partir de una fecha

  String _determineZodiacSign(DateTime date) {
    int day = date.day;
    int month = date.month;
  // Dependiendo del mes y el día, determinamos el signo del zodiaco
    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
      return "Aries";
    } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
      return "Taurus";
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
      return "Gemini";
    } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
      return "Cancer";
    } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
      return "Leo";
    } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
      return "Virgo";
    } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
      return "Libra";
    } else if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
      return "Scorpio";
    } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
      return "Sagittarius";
    } else if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) {
      return "Capricorn";
    } else if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
      return "Aquarius";
    } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
      return "Pisces";
    }
    return "Unknown"; //// En caso de que la fecha esté de alguna manera fuera de rango
  }

 // Método para construir la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyHealthAppDrawer(),
      appBar: AppBar(title: Text("Zodiac Sign Calculator")), // Barra de título
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',          // Etiqueta del campo de texto
                hintText: 'Enter your name', // Texto de sugerencia del campo de texto
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _presentDatePicker,   // Al pulsar el botón, mostramos el selector de fecha
              child: Text(_selectedDate == null
                  ? 'Pick your birthdate'      // Si no se ha seleccionado ninguna fecha, mostramos este texto
                  : 'Change birthdate'),
            ),
            SizedBox(height: 20),
            // Si se ha calculado el signo del zodiaco, mostramos un texto con el nombre del usuario y su signo del zodiaco
            if (_zodiacSign != null)
              Text(
                  'Hello, ${_nameController.text}! Your Zodiac Sign is $_zodiacSign.',
                  style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}