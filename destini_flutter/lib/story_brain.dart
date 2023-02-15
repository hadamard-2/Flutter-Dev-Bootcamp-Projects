import 'story.dart';

class StoryBrain {
  // define the binary tree of stories (make sure it's private) - use array implementation
  final List<Story> _stories = [
    Story(
      storyText:
          'You find yourself wandering through the dark streets of an unknown city. The mist obscures your vision, and a chill wind sends shivers down your spine. As you walk, you come across an old and eerie-looking mansion. It stands tall and imposing, casting an eerie shadow across the street.',
      choice1: 'Approach the mansion to investigate.',
      choice2: 'Continue on your way, trying to avoid it.',
    ),
    Story(
      storyText:
          'You approach the mansion, and as you reach the front door, it creaks open. You step inside, and the door slams shut behind you. You find yourself in a dark and spooky hallway with doors leading off in every direction. Suddenly, you hear a noise coming from one of the rooms.',
      choice1: 'Investigate the noise.',
      choice2: 'Try to find a way out of the mansion.',
    ),
    Story(
      storyText:
          'You continue on your way, but you can\'t shake the feeling that something is watching you. Suddenly, you hear footsteps behind you, and you turn around to see a shadowy figure advancing towards you.',
      choice1: 'Stand your ground and confront the figure.',
      choice2: 'Run away as fast as you can.',
    ),
    Story(
      storyText:
          'You cautiously make your way towards the room from which the noise is coming. As you reach the door, it suddenly swings open, and a figure steps out, blocking your way. It\'s a tall, gaunt man with a wild look in his eyes. He lunges at you with a knife, and you realize too late that you\'ve made a grave mistake.',
      choice1: 'Restart',
      choice2: '',
    ),
    Story(
      storyText:
          'You try to retrace your steps, but the hallway seems to have changed, and you\'re hopelessly lost. You wander for what seems like hours until you finally find a door that leads outside. As you step out into the fresh air, you feel a sense of relief and make your way back to your hotel.',
      choice1: 'Restart',
      choice2: '',
    ),
    Story(
      storyText:
          'You stand your ground, but as the figure gets closer, you realize that it\'s not human. It\'s a monstrous creature with razor-sharp claws and teeth. It attacks you, and you\'re unable to defend yourself against its ferocious onslaught.',
      choice1: 'Restart',
      choice2: '',
    ),
    Story(
      storyText:
          'You run as fast as you can, your heart pounding in your chest. You manage to lose the creature and make your way back to your hotel, where you vow never to venture out into the misty streets again.',
      choice1: 'Restart',
      choice2: '',
    ),
  ];

  int _storyIndex = 0;

  // define a method that returns the current story
  Story currentStory() {
    return _stories[_storyIndex];
  }

  // define a method that goes to next story based on user's choice
  void choosePath(int choice) {
    if ((_storyIndex * 2) + choice > _stories.length - 1) {
      reset();
      return;
    }
    _storyIndex = (_storyIndex * 2) + choice;
  }

  // create a method called reset that sets the current story to the first story (root story)
  void reset() {
    _storyIndex = 0;
  }

  // create a method that checks if whether or not a button should be visible based on current story's choice value (if it's null the button shouldn't be visible)
  bool isButtonVisible(int buttonNumber) {
    if (buttonNumber == 1 && currentStory().choice1 == '') {
      return false;
    } else if (buttonNumber == 2 && currentStory().choice2 == '') {
      return false;
    }
    return true;
  }
}
