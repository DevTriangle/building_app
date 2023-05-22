class BuilderGroup {
  final String name;
  final int count;

  BuilderGroup(this.name, this.count);

  factory BuilderGroup.fromJson(Map<String, dynamic> json) {
    return BuilderGroup(
      json["name"],
      json["count"],
    );
  }

  Map toJson() => {
        "name": name,
        "count": count,
      };
}
