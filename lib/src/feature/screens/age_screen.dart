import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_health_app/src/feature/widgets/my_health_app_drawer.dart';

import 'package:flutter/material.dart';

// Seleccionar la fecha de nacimiento y calcular la edad en función de esa fecha

//Definimos una clase AgeScreen que hereda de StatefulWidget, lo que significa que su estado puede cambiar a lo largo del tiempo
class AgeScreen extends StatefulWidget {
  @override
  _AgeScreenState createState() => _AgeScreenState();
}

// Definimos una clase _AgeScreenState que hereda de State y está asociada con AgeScreen
class _AgeScreenState extends State<AgeScreen> {
  DateTime? _selectedDate; // Almacena la fecha seleccionada por el usuario
  int? _age; // Almacena la edad calculada a partir de la fecha seleccionada

  // Método para mostrar el selector de fecha
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Fecha inicial es la fecha actual
      firstDate: DateTime(
          1900), // La fecha más antigua que se puede seleccionar es 1900
      lastDate: DateTime
          .now(), // La fecha más reciente que se puede seleccionar es la fecha actual
    ).then((pickedDate) {
      if (pickedDate == null)
        return; // Si no se selecciona ninguna fecha, no hace nada
      setState(() {
        // Actualizamos el estado de la aplicación
        _selectedDate = pickedDate; // Guarda la fecha seleccionada
        _age = _calculateAge(pickedDate); // Guarda la edad
      });
    });
  }

  // Método para calcular la edad a partir de una fecha de nacimiento
  int _calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now(); // Obtiene la fecha actual
    int age = currentDate.year -
        birthDate
            .year; //Calcula la diferencia en años entre la fecha actual y la fecha de nacimiento
    /* Si el mes actual es menor que el mes de nacimiento, o si estamos en el mes de nacimiento pero
    el día actual es menor que el día de nacimiento, restamos uno a la edad */
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }
    return age; //Devuelve la edad calculada.
  }

  // Método para construir la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:
          MyHealthAppDrawer(), //Incluye un cajón de navegación personalizado.
      appBar: AppBar(
          title: Text("Age Calculator")), //Barra de título "Age Calculator".
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Espaciado alrededor del cuerpo
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centramos los elementos de la columna
          children: [
            ElevatedButton(
              onPressed: _presentDatePicker,
              child: Text(_selectedDate == null
                  ? 'Select your birthdate'
                  : 'Change birthdate (${_selectedDate!.toIso8601String().substring(0, 10)})'),
            ),
            SizedBox(height: 20), // Espaciado vertical
            if (_age !=
                null) // Si se ha calculado la edad, mostramos un texto con la edad
              Text('You are $_age years old.', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
