import 'package:clean_architecture_flutter/core/error/failures.dart';
import 'package:clean_architecture_flutter/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
}
