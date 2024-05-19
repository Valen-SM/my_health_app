import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_health_app/src/feature/widgets/my_health_app_drawer.dart';

//Calcular y mostrar el Índice de Masa Corporal (IMC) junto con la categoría correspondiente

// Define una clase BmiScreen que hereda de StatefulWidget, lo que significa que su estado puede cambiar a lo largo del tiempo
class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

// Definimos una clase _BmiScreenState que hereda de State y está asociada con BmiScreen
class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController _weightController =
      TextEditingController(); // Controlador para el campo de texto del peso
  final TextEditingController _heightController =
      TextEditingController(); // Controlador para el campo de texto de la altura
  double? _bmi; // Índice de masa corporal calculado
  String? _category; // Categoría del IMC

  // Método para calcular el IMC
  void _calculateBMI() {
    final double weight = double.tryParse(_weightController.text) ??
        0; // Obtenemos el peso del campo de texto
    final double height = double.tryParse(_heightController.text) ??
        0; // Obtenemos la altura del campo de texto
    if (weight > 0 && height > 0) {
      // Si el peso y la altura son mayores que cero, calculamos el IMC
      final double heightInMeters = height / 100; // Convert cm to meters
      setState(() {
        // Actualiza el estado de la aplicación
        _bmi = weight / (heightInMeters * heightInMeters); // Calculamos el IMC
        _category =
            _determineCategory(_bmi!); // Determinamos la categoría del IMC
      });
    }
  }

  // Método para determinar la categoría del IMC
  String _determineCategory(double bmi) {
    if (bmi < 18.5)
      return "Underweight"; // Si el IMC es menor que 18.5, la categoría es "Bajo peso"
    else if (bmi < 25)
      return "Normal"; // Si el IMC es menor que 25, la categoría es "Normal"
    else if (bmi < 30)
      return "Overweight"; // Si el IMC es menor que 30, la categoría es "Sobrepeso"
    else
      return "Obese"; // Si el IMC es mayor o igual que 30, la categoría es "Obesidad"
  }

  // Método para construir la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyHealthAppDrawer(), // Cajón de navegación
      appBar: AppBar(title: Text("BMI Calculator")), //Barra de titulo
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller:
                  _weightController, // Controlador para el campo de texto del peso
              keyboardType:
                  TextInputType.number, // El teclado es de tipo numérico
              decoration: InputDecoration(
                  labelText: 'Weight (kg)', // Etiqueta del campo de texto
                  border: OutlineInputBorder(), // Borde del campo de texto
                  hintText:
                      'Enter your weight in kg' // Texto de sugerencia del campo de texto
                  ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Height (cm)', // Etiqueta del campo de texto
                  border: OutlineInputBorder(), // Borde del campo de texto
                  hintText:
                      'Enter your height in cm' // Texto de sugerencia del campo de texto
                  ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI, // Al pulsar el botón, calculamos el IMC
              child: Text('Calculate BMI'), // Texto del botón
            ),
            SizedBox(height: 20),
            if (_bmi != null)
              Text('Your BMI: ${_bmi!.toStringAsFixed(2)} ($_category)',
                  style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
