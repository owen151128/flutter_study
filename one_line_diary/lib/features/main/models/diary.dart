class Diary {
  String text;
  DateTime createdAt;

  Diary({required this.text, required this.createdAt});

  Map<String, dynamic> toJson() {
    return {"text": text, "createdAt": createdAt.toString()};
  }

  factory Diary.fromJson(Map<String, dynamic> jsonMap) {
    String? text = jsonMap["text"];
    String? createdAt = jsonMap["createdAt"];

    if (text == null || createdAt == null) {
      return Diary(text: "불러오기 오류", createdAt: DateTime.now());
    }

    return Diary(text: text, createdAt: DateTime.parse(createdAt));
  }
}
