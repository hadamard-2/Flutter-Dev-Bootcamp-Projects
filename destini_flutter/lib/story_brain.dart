import 'story.dart';

class StoryBrain {
  final Story _rootStory = Story(
    storyText:
        '''You find yourself in the year 1887, standing outside 221B Baker Street, the infamous address of the great detective Sherlock Holmes. You've heard of his remarkable deductive skills and have come to ask for his assistance in solving a personal matter.
        But as you knock on the door, you realize that this is not just any ordinary day at Baker Street. The door creaks open to reveal a frantic Mrs. Hudson, who informs you that Sherlock Holmes has gone missing and it's up to you to find him.''',
    option1:
        '''Take on the challenge and search for Sherlock Holmes on your own.''',
    option2:
        '''Ask Mrs. Hudson for more information and any leads that could help in your search.''',
  );
  final Story _story0 = Story(
    storyText:
        '''You set out on your journey, determined to solve the mystery and find the great detective. After days of searching and following leads, you find yourself in the dark alleyways of London's underworld, face to face with the city's most dangerous criminal.''',
    option1:
        '''Confront the criminal and demand information about Sherlock's whereabouts.''',
    option2: '''Slip away unnoticed and seek help from the police.''',
  );
  final Story _story1 = Story(
    storyText:
        '''Mrs. Hudson provides you with a clue left behind by Sherlock, a cryptic message that leads you to a seedy pub in the heart of London. There, you are approached by a shady figure who reveals that the detective has been taken captive by a mysterious society.''',
    option1: '''Confront the society and demand his release.''',
    option2: '''Inform the police and let them handle the situation.''',
  );
  final Story _story00 = Story(
    storyText:
        '''Your bravery impresses the criminal, who, in a surprising turn of events, provides valuable information about Sherlock's disappearance. You soon learn that the detective has been taken captive by a mysterious society that seeks to use his brilliant mind for their own gain.''',
    option1: '''Rush to his rescue, regardless of the danger.''',
    option2: '''Inform the police and let them handle the situation.''',
  );
  final Story _story000 = Story(
    storyText:
        '''You charge into the lair of the mysterious society, determined to save your friend. With your quick thinking and bravery, you are able to outwit the society's members and free Sherlock. The two of you emerge victorious and make your way back to Baker Street, where you are hailed as heroes.''',
  );
  final Story _story001 = Story(
    storyText:
        '''The police launch a full-scale investigation, but it quickly becomes clear that they are out of their depth. With time running out, you decide to take matters into your own hands and, with the help of Sherlock's insights, are able to rescue him and bring the society to justice.''',
  );
  final Story _story01 = Story(
    storyText:
        '''Working with the police, you are able to track down and arrest the criminal, who reveals under questioning that Sherlock has been taken captive by a mysterious society. With this information, the police mount a rescue operation, and you are there to witness the detective's triumphant return to Baker Street.''',
  );
  final Story _story10 = Story(
    storyText:
        '''You bravely make your way to the lair of the mysterious society, where you engage in a tense standoff. In a shocking twist, Sherlock appears, having outwitted his captors and freed himself. Together, the two of you make a daring escape and return to Baker Street, where you are hailed as heroes.''',
  );
  final Story _story11 = Story(
    storyText:
        '''The police launch a full-scale investigation and, with Sherlock's help, are able to track down and raid the society's lair. The detective is freed, and the society is brought to justice. The two of you return to Baker Street, where you are hailed as heroes.''',
  );

  StoryBrain() {
    _rootStory.path1Story = _story0;
    _rootStory.path2Story = _story1;

    _story0.path1Story = _story00;
    _story0.path2Story = _story01;

    _story1.path1Story = _story10;
    _story1.path2Story = _story11;

    _story00.path1Story = _story000;
    _story00.path2Story = _story001;
  }

  Story get rootStory {
    return _rootStory;
  }
}
