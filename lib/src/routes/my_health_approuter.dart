import 'package:go_router/go_router.dart';
import 'package:my_health_app/src/feature/screens/age_screen.dart';
import 'package:my_health_app/src/feature/screens/bmi_screen.dart';
import 'package:my_health_app/src/feature/screens/home_screen.dart';
import 'package:my_health_app/src/feature/screens/zodiac_screen.dart';

//Definir las rutas
class MyHealthApprouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomeScreen()),
      GoRoute(path: '/bmi', builder: (context, state) => BmiScreen()),
      GoRoute(path: '/age', builder: (context, state) => AgeScreen()),
      GoRoute(path: '/zodiac', builder: (context, state) => ZodiacScreen()),
    ],
  );
}
