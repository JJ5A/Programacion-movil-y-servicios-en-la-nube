import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pmsn_2025_2/utils/value_listener.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _SelectedTab _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,

        actions: [
          ValueListenableBuilder(
            valueListenable: ValueListener.isDark,
            builder: (context, value, child) {
              return value
                  ? IconButton(
                      icon: Icon(Icons.nightlight_round),
                      onPressed: () {
                        // Cambiar a tema oscuro
                        ValueListener.isDark.value = false;
                      },
                    )
                  : IconButton(
                      icon: Icon(Icons.wb_sunny_rounded),
                      onPressed: () {
                        // Cambiar a tema claro
                        ValueListener.isDark.value = true;
                      },
                    );
            },
          ),
        ],
      ),
      drawer: Drawer(),
      body: Center(child: Text('Menu de opciones')),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 100),
        child: DotNavigationBar(
          margin: EdgeInsets.only(left: 10, right: 10),
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          dotIndicatorColor: Colors.white,
          unselectedItemColor: Colors.grey[300],
          splashBorderRadius: 50,
          // enableFloatingNavBar: false,
          onTap: _handleIndexChanged,
          items: [
            /// Home
            DotNavigationBarItem(
              icon: Icon(Icons.home),
              selectedColor: Color(0xff73544C),
            ),

            /// Likes
            DotNavigationBarItem(
              icon: Icon(Icons.favorite),
              selectedColor: Color(0xff73544C),
            ),

            /// Search
            DotNavigationBarItem(
              icon: Icon(Icons.search),
              selectedColor: Color(0xff73544C),
            ),

            /// Profile
            DotNavigationBarItem(
              icon: Icon(Icons.person),
              selectedColor: Color(0xff73544C),
            ),
          ],
        ),
      ),
    );
  }
}

enum _SelectedTab { home, favorite, search, person }
