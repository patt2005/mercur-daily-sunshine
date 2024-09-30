class DailyTask {
  final String title;
  final String text;
  final int coinsReward;

  DailyTask({
    required this.title,
    required this.text,
    required this.coinsReward,
  });

  static DailyTask fromJson(Map<String, dynamic> data) {
    return DailyTask(
      title: data["title"],
      text: data["text"],
      coinsReward: data["coins"],
    );
  }
}
