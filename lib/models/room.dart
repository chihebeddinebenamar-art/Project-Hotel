/// Modèle simple pour une chambre affichée en liste et sur l’écran détail (données statiques).
class Room {
  const Room({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.pricePerNight,
    required this.rating,
    required this.capacityLabel,
    required this.description,
    required this.reviewCount,
    this.isFavorite = false,
  });

  final String id;
  final String title;
  final String imagePath;
  final String pricePerNight;
  final double rating;
  final String capacityLabel;
  final String description;
  final int reviewCount;
  final bool isFavorite;
}
