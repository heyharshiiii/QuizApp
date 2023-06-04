class QuizQuestion
{
  const QuizQuestion(this.texts,this.answers);
  final String texts;
  final List<String> answers;
  List<String> getShuffledAnswers()
  {
    final shuffledList=List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}