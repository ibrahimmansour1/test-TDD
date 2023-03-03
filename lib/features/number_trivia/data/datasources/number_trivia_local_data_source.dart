import 'package:tdd/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource {
  ///Gets the cached [NumberTriviaModel] which was gotten the last time
  ///the user had an internet connection
  ///
  ///Throws [CacheExceptions] if no cached data is present.
  Future<NumberTriviaModel> getLastNumberTrivia();
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}
