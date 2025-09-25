import 'package:flutter/material.dart';
import 'package:pmsn_2025_2/utils/value_listener.dart';
import 'package:pmsn_2025_2/practica1/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _SelectedTab _selectedTab = _SelectedTab.home;

  void _onTabChanged(int index) {
    setState(() {
      _selectedTab = _SelectedTab.values[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const Center(child: Text('Inicio')),
      const Center(child: Text('Favoritos')),
      const Center(child: Text('Buscar')),
      const Center(child: Text('Perfil')),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Mi App'),
        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: ValueListener.isDark,
            builder: (context, isDark, child) {
              return IconButton(
                icon: Icon(isDark ? Icons.nightlight_round : Icons.wb_sunny_rounded),
                onPressed: () => ValueListener.isDark.value = !isDark,
              );
            },
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Josue Julian Nunez Perez"),
              accountEmail: Text("juliannunez@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(  'https://i.pravatar.cc/300'),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.school, color: Colors.green),
              title: const Text('Práctica 1'),
              subtitle: const Text('Reto de flutter de personajes'),
              onTap: () {
              Navigator.pop(context); // Cierra el Drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
              },
            ),
            ListTile(
              leading: Icon(Icons.movie, ),
              title: Text('List Movies'),
              subtitle: Text('Database Movies'),
              trailing: Icon(Icons.chevron_right, size: 16),
              onTap: () => {
                Navigator.pushNamed(context, "/listdb"),
              },
            )
          ],
        ),
      ),

      body: SafeArea(
        child: IndexedStack(
          index: _SelectedTab.values.indexOf(_selectedTab),
          children: pages,
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          onTap: _onTabChanged,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ],
        ),
      ),
    );
  }
}

enum _SelectedTab { home, favorite, search, person }
