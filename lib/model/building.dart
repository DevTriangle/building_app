class Building {
  final String label;
  final String image;
  final int roomCount;
  final double square;
  final double price;
  bool isFavorite;

  Building(this.label, this.image, this.roomCount, this.square, this.price, this.isFavorite);

  factory Building.fromJson(Map<String, dynamic> json) {
    return Building(
      json["label"],
      json["image"],
      json["roomCount"],
      json["square"],
      json["price"],
      json["isFavorite"],
    );
  }

  Map toJson() => {
        "label": label,
        "image": image,
        "roomCount": roomCount,
        "square": square,
        "price": price,
        "isFavorite": isFavorite,
      };
}
