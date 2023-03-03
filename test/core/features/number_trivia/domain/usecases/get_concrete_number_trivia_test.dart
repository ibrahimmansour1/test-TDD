import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

import 'get_concrete_number_trivia_test.mocks.dart';

// class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {}
@GenerateMocks([NumberTriviaRepository])
void main() {
  GetConcreteNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository!);
  });
  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(text: 'test', number: 1);
  test('should get trivia for the number from the repository', () async {
    //arrange
    when(mockNumberTriviaRepository?.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));
    //act
    final result = await usecase?.call(Params(number: tNumber));
    //asset
    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository?.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
