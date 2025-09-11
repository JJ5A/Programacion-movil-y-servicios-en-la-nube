import 'package:flutter/material.dart';
import 'package:pmsn_2025_2/practica1/hero_model.dart';


class HeroDetailsPage extends StatefulWidget {
  final HeroModel hero;

  const HeroDetailsPage(this.hero, {super.key});
  @override
  _HeroDetailsPageState createState() => _HeroDetailsPageState();
}
  
class _HeroDetailsPageState extends State<HeroDetailsPage> {
  final double appBarHeight = 80.0;
  late final ScrollController _scrollController;
  double toolbarOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset <= appBarHeight) {
          toolbarOpacity =
              (appBarHeight - _scrollController.offset) / appBarHeight;
        } else {
          toolbarOpacity = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
           Color.fromARGB(255, 202, 68, 148),
              Color.fromARGB(255, 75, 244, 106),
            ],
            begin: Alignment(0.3, -1),
            end: Alignment(-0.8, 1),
          ),
        ),
        child: Stack(
          children: [
            ListView(
              controller: _scrollController,
              padding: EdgeInsets.only(top: appBarHeight),
              children: [
                _HeroDetailsImage(widget.hero),
                _HeroDetailsName(widget.hero),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
                  child: Text(
                    widget.hero.descripcion,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    const SizedBox(width: 28),
                    Expanded(
                      child: SizedBox(
                        height: 54,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: const Text(
                            'Add Favourite',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)),
                            padding: const EdgeInsets.all(0.0),
                          ),
                          child: Ink(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 237, 242, 88),
                                    Color.fromARGB(255, 154, 93, 239),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.0)),
                            ),
                            child: Container(
                              constraints: const BoxConstraints(
                                  minWidth: 88.0, minHeight: 36.0),
                              alignment: Alignment.center,
                              child: const Text(
                                'OK',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 28),
                  ],
                ),
                const SizedBox(height: 28),
              ],
            ),
            SafeArea(
              child: Opacity(
                opacity: toolbarOpacity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 18),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const Text(
                      'Overview',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroDetailsImage extends StatelessWidget {
  final HeroModel hero;

  const _HeroDetailsImage(this.hero);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0, left: 28.0, right: 28.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(28)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(28)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(Radius.circular(28)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Hero(
                        tag: hero.name,
                        child: Image.asset(
                          hero.image,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroDetailsName extends StatelessWidget {
  final HeroModel hero;

  const _HeroDetailsName(this.hero);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Text(
                    hero.name,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.1),
                      fontWeight: FontWeight.bold,
                      fontSize: 56,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  hero.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                    shadows: [
                      Shadow(
                        blurRadius: 8.0,
                        color: Colors.black54,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Mostrar datos del héroe
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/elixir.png', // Cambia la ruta si tu icono está en otro lugar
                    width: 62,
                    height: 62,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    hero.elixir.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        hero.health.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        'Vida',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      Text(
                        hero.attack.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        'Ataque',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      Text(
                        hero.speed.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        'Velocidad',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ],
      ),
    );
  }
}