import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData darkTheme() {
    final theme = ThemeData.dark().copyWith(
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFF1F1F1F), // Fondo principal más profundo
        onPrimary: Color(0xFFE0E0E0), // Texto claro sobre fondo oscuro
        secondary: Color.fromARGB(
          255,
          128,
          103,
          29,
        ), // Amarillo cálido para acentos
        onSecondary: Color(0xFF1F1F1F), // Texto oscuro sobre acento claro
        error: Color(0xFFCF6679), // Rojo suave para errores
        onError: Color(0xFFFFFFFF), // Texto blanco sobre error
        surface: Color(0xFF2C2C2C), // Paneles y tarjetas
        onSurface: Color.fromARGB(255, 159, 109, 109), // Texto sobre superficie
      ),
    );
    return theme;
  }

  static ThemeData lightTheme() {
    final theme = ThemeData.light().copyWith(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(
          0xFF1976D2,
        ), // Azul profesional para encabezados y botones
        onPrimary: Color(0xFFFFFFFF), // Texto blanco sobre azul
        secondary: Color(0xFFFFC107), // Amarillo cálido para acentos
        onSecondary: Color(0xFF000000), // Texto oscuro sobre acento claro
        error: Color(0xFFD32F2F), // Rojo intenso para errores
        onError: Color(0xFFFFFFFF), // Texto blanco sobre error
        surface: Color(0xFFF5F5F5), // Paneles y tarjetas
        onSurface: Color(0xFF212121), // Texto oscuro sobre superficie clara
      ),
    );
    return theme;
  }
}
