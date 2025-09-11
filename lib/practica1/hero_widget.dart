import 'package:flutter/material.dart';
import 'package:pmsn_2025_2/practica1/attribute_widget.dart';
import 'package:pmsn_2025_2/practica1/hero_details_page.dart';
import 'dart:math' as math;
import 'hero_model.dart';

// Degree / Radians converter
const double degrees2Radians = math.pi / 180.0;
const double radians2Degrees = 180.0 / math.pi;

double degrees(double radians) => radians * radians2Degrees;
double radians(double degrees) => degrees * degrees2Radians;

class HeroRowWidget extends StatelessWidget {
  final HeroModel hero;
  final double rowHeight;

  const HeroRowWidget({
    super.key,
    required this.hero,
    this.rowHeight = 282,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: rowHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Fondo 1
          Transform.translate(
            offset: const Offset(-10, 0),
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateY(radians(1.5)),
              child: Container(
                height: 216,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(22)),
                ),
              ),
            ),
          ),
          // Fondo 2
          Transform.translate(
            offset: const Offset(-44, 0),
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateY(radians(8)),
              child: Container(
                height: 188,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: const BorderRadius.all(Radius.circular(22)),
                ),
              ),
            ),
          ),
          // Imagen y nombre del héroe
          Row(
            children: [
              Transform.translate(
                offset: const Offset(-30, 0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Hero(
                      tag: hero.name,
                      child: Image.asset(
                        hero.image,
                        width: rowHeight,
                        height: rowHeight,
                      ),
                    ),
                    Container(
                      width: rowHeight,
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Glow effect
                          Text(
                            hero.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 6
                                ..color = Colors.blueAccent.withOpacity(0.7),
                              shadows: [
                                Shadow(
                                  blurRadius: 16,
                                  color: Colors.blueAccent.withOpacity(0.7),
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                          ),
                          // Main text
                          Text(
                            hero.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              letterSpacing: 2,
                              shadows: [
                                Shadow(
                                  blurRadius: 8.0,
                                  color: Colors.black87,
                                  offset: Offset(2, 2),
                                ),
                              ],
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blueAccent,
                              decorationThickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Atributos y botón
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(right: 58),
              padding: const EdgeInsets.symmetric(vertical: 34),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AttributeWidget(
                    progress: hero.speed,
                    child: Image.asset(speed),
                  ),
                  AttributeWidget(
                    progress: hero.health,
                    child: Image.asset(heart),
                  ),
                  AttributeWidget(
                    progress: hero.attack,
                    child: Image.asset(knife),
                  ),
                  AttributeWidget(
                    progress: hero.elixir.toDouble()*10,
                    child: Image.asset(elixir),
                  ),
                  SizedBox(
                    height: 32,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HeroDetailsPage(hero),
                          ),
                        );
                      },
                      child: const Text(
                        'Ver detalles',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}