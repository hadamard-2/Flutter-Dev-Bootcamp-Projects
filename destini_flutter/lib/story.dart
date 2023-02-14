class Story {
  final String _storyText;
  final String _choice1;
  final String _choice2;

  Story(
      {required String storyText,
      required String choice1,
      required String choice2})
      : _choice2 = choice2,
        _choice1 = choice1,
        _storyText = storyText;

  String get storyText {
    return _storyText;
  }

  String get choice1 {
    return _choice1;
  }

  String get choice2 {
    return _choice2;
  }
}
