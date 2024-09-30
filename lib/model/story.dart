class Story {
  final String title;
  final String text;
  final int cost;

  Story({
    required this.title,
    required this.text,
    required this.cost,
  });

  static Story fromJson(Map<String, dynamic> data) {
    return Story(
      title: data["title"],
      text: data["text"],
      cost: data["cost"],
    );
  }
}
