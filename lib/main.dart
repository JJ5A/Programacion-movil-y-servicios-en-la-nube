import 'package:flutter/material.dart';
import 'package:pmsn_2025_2/add_movie_screen.dart';
import 'package:pmsn_2025_2/home_screen.dart';
import 'package:pmsn_2025_2/login_screen.dart';
import 'package:pmsn_2025_2/practica2/Splash_screen.dart';
import 'package:pmsn_2025_2/practica2/home_page.dart';
import 'package:pmsn_2025_2/practica2/login.dart';
import 'package:pmsn_2025_2/utils/list_movies.dart';
import 'package:pmsn_2025_2/utils/theme_app.dart';
import 'package:pmsn_2025_2/utils/value_listener.dart';



void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ValueListener.isDark,
      builder: (context, isDark, _) {
        return MaterialApp(
          theme: isDark ? ThemeApp.darkTheme() : ThemeApp.lightTheme(),
          routes: {
            "/home": (context) => HomeScreen(),
            "/listdb": (context) => ListMovies(),
            "/splash": (context) => const SplashScreen(),
            "/add" : (context)=> const AddMovieScreen(),
            "/loginp3": (context) => const LoginScreenp3(),
            "/homefigma": (context) => const HomePage(),
          },
          title: 'Material App',
          home: LoginScreen(),
        );
      }
    );
  }

}
