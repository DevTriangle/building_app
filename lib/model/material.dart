class AppMaterial {
  final int id;
  final String name;

  AppMaterial(this.id, this.name);

  factory AppMaterial.fromJson(Map<String, dynamic> json) {
    return AppMaterial(
      json["id"],
      json["name"],
    );
  }

  Map toJson() => {
        "id": id,
        "name": name,
      };
}
