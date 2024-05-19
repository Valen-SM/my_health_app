import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_health_app/src/feature/widgets/my_health_app_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyHealthAppDrawer(),
      appBar: AppBar(
        title: Text(
            'Welcome to Health App'), // Título de la barra de la aplicación
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context
                  .push('/age'), // Al pulsar el botón, navegamos a la ruta
              child: Text('Calculate Age'), // Texto del botón
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Color de fondo del botón
                foregroundColor: Colors.white, // Color del texto del botón
                padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 18), // Espaciado alrededor del texto del botón
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context
                  .push('/bmi'), // Al pulsar el botón, navegamos a la ruta
              child: Text('Calculate BMI'), // Texto del botón
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Color de fondo del botón
                foregroundColor: Colors.white, // Color del texto del botón
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 18),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context
                  .push('/zodiac'), // Al pulsar el botón, navegamos a la ruta
              child: Text('Determine Zodiac Sign'), // Texto del botón
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Color de fondo del botón
                foregroundColor: Colors.white, // Color del texto del botón
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
