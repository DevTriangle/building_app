class Building {
  final String label;
  final String image;
  final int roomCount;
  final double square;
  final double price;

  Building(this.label, this.image, this.roomCount, this.square, this.price);

  factory Building.fromJson(Map<String, dynamic> json) {
    return Building(
      json["label"],
      json["image"],
      json["roomCount"],
      json["square"],
      json["price"],
    );
  }

  Map toJson() => {
        "label": label,
        "image": image,
        "roomCount": roomCount,
        "square": square,
        "price": price,
      };
}
