class HeroModel {
  final String name;
  final String image; // ruta del asset, no un widget
  final double speed;
  final double health;
  final double attack;
  final String descripcion;
  final int elixir;

  const HeroModel({
    required this.name,
    required this.image,
    required this.speed,
    required this.health,
    required this.attack,
    required this.descripcion,
    required this.elixir,
  });
}

const List<HeroModel> heroes = [
  HeroModel(
    name: 'Monta Puercos',
    image: 'assets/images/monta.png',
    speed: 90,
    health: 45.0,
    attack: 60.0,
    descripcion: 'Este intrépido jinete ignora a las tropas y carga directo contra las estructuras enemigas. Su fuerza brilla cuando se lanza en ciclos rápidos, presionando sin descanso y obligando al rival a reaccionar.',
    elixir: 4,
  ),
  HeroModel(
    name: 'Caballero',
    image: 'assets/images/caballero.webp',
    speed: 35.0,
    health: 50.0,
    attack: 30.0,
    descripcion: 'El Caballero es una unidad de combate cuerpo a cuerpo que destaca por su alta resistencia y capacidad de infligir daño. Su armadura pesada le permite absorber mucho daño, convirtiéndolo en un tanque en el campo de batalla.',
    elixir: 3,
  ),
  HeroModel(
    name: 'Bruja',
    image: 'assets/images/bruja.webp',
    speed: 35.0,
    health: 40.0,
    attack: 40.0,
    descripcion: 'La Bruja es una unidad que invoca esqueletos para luchar a su lado, proporcionando apoyo adicional en el campo de batalla. Aunque no es muy rápida, su capacidad para generar tropas la convierte en una amenaza constante para el enemigo.',
    elixir: 5
  ),
];
