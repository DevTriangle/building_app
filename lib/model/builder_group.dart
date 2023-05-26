class BuilderGroup {
  final String name;
  final int count;
  bool isFavorite;

  BuilderGroup(this.name, this.count, this.isFavorite);

  factory BuilderGroup.fromJson(Map<String, dynamic> json) {
    return BuilderGroup(
      json["name"],
      json["count"],
      json["isFavorite"],
    );
  }

  Map toJson() => {
        "name": name,
        "count": count,
        "isFavorite": isFavorite,
      };
}
