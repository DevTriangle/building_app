class Note {
  String title;
  String text;

  Note(this.title, this.text);

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      json['title'],
      json['text'],
    );
  }

  Map toJson() => {"title": title, "text": text};
}
