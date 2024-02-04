import 'dart:convert';

import 'package:clean_code_architecture_and_tdd_reso_coder/core/error/exceptions.dart';
import 'package:clean_code_architecture_and_tdd_reso_coder/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NumberTriviaLocalDataSource {
  /// Gets the cached [NumberTriviaModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<NumberTriviaModel> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}

const CACHED_NUMBER_TRIVIA = 'CACHED_NUMBER_TRIVIA';

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  final SharedPreferences sharedPreferences;

  NumberTriviaLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) {
    return sharedPreferences.setString(
      CACHED_NUMBER_TRIVIA,
      jsonEncode(
        triviaToCache.toJson(),
      ),
    );
  }

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    //this will return a string  , but we need to share future . so we will transform it to future
    final jsonString = sharedPreferences.getString(CACHED_NUMBER_TRIVIA);

    if (jsonString != null) {
      return Future.value(
        NumberTriviaModel.fromJson(
          jsonDecode(
            jsonString,
          ),
        ),
      );
    } else {
      throw CacheExceptions();
    }
  }
}
