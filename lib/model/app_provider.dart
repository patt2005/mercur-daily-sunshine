import 'package:flutter/cupertino.dart';
import 'package:mercur_daily_sunshine/model/daily_task.dart';
import 'package:mercur_daily_sunshine/model/story.dart';

class AppProvider extends ChangeNotifier {
  int _totalCoins = 320;
  int get totalCoins => _totalCoins;

  int _avatarIndex = 0;
  int get avatarIndex => _avatarIndex;

  String _nickname = "";
  String get nickname => _nickname;

  final List<Story> _boughtStories = [];
  List<Story> get boughtStories => _boughtStories;

  final List<DailyTask> _doneTasks = [];
  List<DailyTask> get doneTasks => _doneTasks;

  final List<int> _boughtAvatarsIndex = [];
  List<int> get boughtAvatarsIndex => _boughtAvatarsIndex;

  void setNickname(String name) {
    _nickname = name;
    notifyListeners();
  }

  void decreaseCoins(int amount) {
    _totalCoins -= amount;
    notifyListeners();
  }

  void addCoins(int amount) {
    _totalCoins += amount;
    notifyListeners();
  }

  void changeAvatarIndex(int index) {
    _avatarIndex = index;
    notifyListeners();
  }

  void addBoughtAvatarIndex(int index) {
    _boughtAvatarsIndex.add(index);
    notifyListeners();
  }

  void addBoughtStory(Story story) {
    _boughtStories.add(story);
    notifyListeners();
  }

  void addDoneTask(DailyTask task) {
    _doneTasks.add(task);
    notifyListeners();
  }
}
