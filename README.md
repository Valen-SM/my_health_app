# My Health App

My Health App es una aplicación desarrollada con Flutter que permite a los usuarios calcular su Índice de Masa Corporal (IMC), su edad y su signo zodiacal a partir de su fecha de nacimiento. La aplicación está diseñada para ser intuitiva y fácil de usar, proporcionando una navegación sencilla entre sus diferentes funcionalidades.

## Características

- **Calculadora de IMC**: Permite a los usuarios ingresar su peso y altura para calcular su Índice de Masa Corporal.
- **Calculadora de Edad**: Calcula la edad del usuario a partir de su fecha de nacimiento.
- **Calculadora de Signo Zodiacal**: Determina el signo zodiacal del usuario según su fecha de nacimiento.
- **Navegación Fácil**: Utiliza un cajón de navegación (`Drawer`) para moverse entre las diferentes pantallas de la aplicación.

## Capturas de Pantalla

![Home Screen](screenshots/home_screen.png)
![BMI Screen](screenshots/bmi_screen.png)
![Age Screen](screenshots/age_screen.png)
![Zodiac Screen](screenshots/zodiac_screen.png)

## Tecnologías Utilizadas

- **Flutter**: Framework de desarrollo de aplicaciones móviles.
- **Dart**: Lenguaje de programación utilizado con Flutter.
- **go_router**: Biblioteca para la navegación declarativa en Flutter.

## Instalación

1. Clona el repositorio:
    ```bash
    git clone https://github.com/tu_usuario/my_health_app.git
    ```
2. Navega al directorio del proyecto:
    ```bash
    cd my_health_app
    ```
3. Instala las dependencias:
    ```bash
    flutter pub get
    ```
4. Corre la aplicación:
    ```bash
    flutter run
    ```

## Uso

1. **Inicio**: La pantalla de inicio proporciona enlaces rápidos a las diferentes funcionalidades de la aplicación.
2. **Calculadora de IMC**: Ingrese su peso en kilogramos y su altura en centímetros, luego presione el botón "Calcular IMC" para ver su índice de masa corporal y su categoría.
3. **Calculadora de Edad**: Seleccione su fecha de nacimiento y la aplicación calculará automáticamente su edad.
4. **Calculadora de Signo Zodiacal**: Seleccione su fecha de nacimiento y la aplicación mostrará su signo zodiacal.

## Código Principal

### MyHealthAppDrawer

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHealthAppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('My Health App'),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 109, 184, 245),
            ),
          ),
          _createDrawerItem(
            context: context,
            text: 'Home',
            route: '/',
          ),
          _createDrawerItem(
            context: context,
            text: 'BMI Calculator',
            route: '/bmi',
          ),
          _createDrawerItem(
            context: context,
            text: 'Age Calculator',
            route: '/age',
          ),
          _createDrawerItem(
            context: context,
            text: 'Zodiac Calculator',
            route: '/zodiac',
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem({
    required BuildContext context,
    required String text,
    required String route,
  }) {
    return ListTile(
      title: Text(text),
      onTap: () {
        Navigator.pop(context);
        context.go(route);
      },
    );
  }
}