import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // ====== DATA (usa SOLO assets locales) ======
  final categories = const [
    _Category(imagetoasset: 'assets/practica3/house.png', label: 'Casas',),
    _Category(icon: Icons.park_rounded, label: 'Camp',),
    _Category(icon: Icons.holiday_village_rounded, label: 'Villa',),
    _Category(icon: Icons.apartment_rounded, label: 'Hotel',),
  ];

  // Reemplaza estos assets por los tuyos (añádelos a pubspec.yaml)
  final popular = const [
    _PlaceCard(
      asset: 'assets/practica3/popular1.jpg',
      title: 'Royal Hotel',
      subtitle: 'Bogor',
      rating: 4.9,
    ),
    _PlaceCard(
      asset: 'assets/practica3/popular2.jpg',
      title: 'Bumi',
      subtitle: 'Katulampa',
      rating: 4.9,
    ),
    _PlaceCard(
      asset: 'assets/practica3/popular3.jpg',
      title: 'Villa',
      subtitle: 'Sawah',
      rating: 4.9,
    ),
  ];

  final nearby = const [
    _PlaceLargeCard(
      asset: 'assets/practica3/nearby1.jpg',
      title: 'Camp Ratu Gede',
    ),
    _PlaceLargeCard(
      asset: 'assets/practica3/nearby2.jpg',
      title: 'Camp hulu cai',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 12, 0, 24),
          children: [
            // Título
            RichText(
              text: TextSpan(
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: Colors.black87,
                  height: 1.15,
                  fontWeight: FontWeight.w700,
                ),
                children: const [
                  TextSpan(text: 'Where do\n', style: TextStyle(color: Colors.black87, fontSize: 36)),
                  TextSpan(
                    text: 'you want to go ?',
                    style: TextStyle(color: const Color (0xFF22B07D), fontSize: 36),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Barra de búsqueda
            TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'find a place to stay',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search_rounded),
                  onPressed: () {},
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                filled: true,
                fillColor: const Color(0xFFF1F2F4),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: (q) {},
            ),
            const SizedBox(height: 20),

            // Categorías
            const _SectionTitle('Category',),
            SizedBox(
              height: 120,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, i) => _CategoryChip(item: categories[i]),
              ),
            ),
            const SizedBox(height: 8),

            // Populares
            const _SectionTitle('Popular'),
            SizedBox(
              height: 210,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: popular.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, i) => _PopularCard(item: popular[i]),
              ),
            ),
            const SizedBox(height: 8),

            // Cercanos
            const _SectionTitle('Nearby residence'),
            SizedBox(
              height: 210,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: nearby.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, i) => _NearbyCard(item: nearby[i]),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation (decorativo)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF22B07D),
        unselectedItemColor: Colors.grey.shade500,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_rounded), label: 'Fav'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_rounded), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}

/* ===================== HELPERS ===================== */

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: Colors.black,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _Category {
  final IconData? icon;
  final String? imagetoasset;
  final String label;
  const _Category({this.icon, this.imagetoasset, required this.label});
}

class _CategoryChip extends StatelessWidget {
  final _Category item;
  const _CategoryChip({required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Column(
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F9F4),
              shape: BoxShape.circle,
              //border: Border.all(color: const Color(0xFF22B07D), width: 1),
            ),
            child: item.icon != null
                ? Icon(item.icon, color: const Color(0xFF22B07D), size: 36)
                : item.imagetoasset != null
                    ? ClipOval(
                        child: Image.asset(
                          item.imagetoasset!, 
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      )
                    : const SizedBox.shrink(),
          ),
          const SizedBox(height: 6),
          Text(
            item.label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
          ),
        ],
      ),
    );
  }
}

class _PlaceCard {
  final String asset;
  final String title;
  final String subtitle;
  final double rating;
  const _PlaceCard({
    required this.asset,
    required this.title,
    required this.subtitle,
    required this.rating,
  });
}

class _PopularCard extends StatelessWidget {
  final _PlaceCard item;
  const _PopularCard({required this.item});

  @override
  Widget build(BuildContext context) {
    const radius = 16.0;
    return SizedBox(
      width: 180,
      child: RepaintBoundary(
        child: Stack(
          children: [
            // Imagen local
            ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Image.asset(
                item.asset,
                height: 210,
                width: 180,
                fit: BoxFit.cover,
              ),
            ),
            // Gradiente
            ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Container(
                height: 210,
                width: 180,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.65)],
                  ),
                ),
              ),
            ),
            // Badge rating
            Positioned(
              left: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF22B07D),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star_rounded, color: Colors.white, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      item.rating.toStringAsFixed(1),
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            // Títulos
            Positioned(
              left: 10,
              right: 10,
              bottom: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16)),
                  Text(item.subtitle,
                      style:
                          TextStyle(color: Colors.white.withOpacity(0.95), fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaceLargeCard {
  final String asset;
  final String title;
  const _PlaceLargeCard({required this.asset, required this.title});
}

class _NearbyCard extends StatelessWidget {
  final _PlaceLargeCard item;
  const _NearbyCard({required this.item});

  @override
  Widget build(BuildContext context) {
    const radius = 16.0;
    return SizedBox(
      width: 260,
      child: RepaintBoundary(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(radius),
                  child: Image.asset(
                    item.asset,
                    height: 160,
                    width: 260,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6,
                          offset: Offset(0, 2),
                          color: Color(0x22000000),
                        )
                      ],
                    ),
                    child: const Icon(Icons.favorite_border, size: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              item.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
