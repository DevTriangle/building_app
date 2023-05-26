class AppMaterial {
  final int id;
  final String name;
  bool isFavorite;

  AppMaterial(this.id, this.name, this.isFavorite);

  factory AppMaterial.fromJson(Map<String, dynamic> json) {
    return AppMaterial(
      json["id"],
      json["name"],
      json["isFavorite"],
    );
  }

  Map toJson() => {
        "id": id,
        "name": name,
        "isFavorite": isFavorite,
      };
}
