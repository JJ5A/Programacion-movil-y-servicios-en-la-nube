import 'package:flutter/material.dart';

import 'hero_model.dart';
import 'hero_widget.dart';

class UiChallenge3 extends StatefulWidget {
  const UiChallenge3({super.key});

  @override
  _UiChallenge3State createState() => _UiChallenge3State();
}

class _UiChallenge3State extends State<UiChallenge3> {
  late final ScrollController _scrollController;
  double toolbarOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset <= 80) {
          toolbarOpacity = (80 - _scrollController.offset) / 80;
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 68, 144, 202),
              Color.fromARGB(255, 224, 237, 88),
            ],
            begin: Alignment(0.3, -1),
            end: Alignment(-0.8, 1),
          ),
        ),
        child: Stack(
          children: [
            ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 80, bottom: 40),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: HeroRowWidget(hero: heroes[index]),
                );
              },
              itemCount: heroes.length,
            ),
            Opacity(
              opacity: toolbarOpacity,
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}