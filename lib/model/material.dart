class AppMaterial {
  final int id;
  final String name;
  final String price;
  bool isFavorite;

  AppMaterial(this.id, this.name, this.price, this.isFavorite);

  factory AppMaterial.fromJson(Map<String, dynamic> json) {
    return AppMaterial(
      json["id"],
      json["name"],
      json["price"],
      json["isFavorite"],
    );
  }

  Map toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "isFavorite": isFavorite,
      };
}
