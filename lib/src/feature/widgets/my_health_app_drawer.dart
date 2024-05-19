import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHealthAppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
                'My Health App'), // Título del encabezado del cajón de navegación
            decoration: BoxDecoration(
              color:
                  Color.fromARGB(255, 164, 209, 245), // Color de fondodel cajon
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              context.go('/');
            },
          ),
          ListTile(
            title: Text('Age calculator'),
            onTap: () {
              Navigator.pop(context);
              context.go('/age');
            },
          ),
          ListTile(
            title: Text('BMI Calculator'),
            onTap: () {
              Navigator.pop(context);
              context.go('/bmi'); // Navegamos a la ruta '/bmi'
            },
          ),
          ListTile(
            title: Text('Zodiac calculator'),
            onTap: () {
              Navigator.pop(context);
              context.go('/zodiac');
            },
          ),
        ],
      ),
    );
  }
}
