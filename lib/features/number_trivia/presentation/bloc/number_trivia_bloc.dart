import 'package:equatable/equatable.dart';

import 'package:bloc/bloc.dart';
import '../../domain/usecases/get_concrete_number_trivia.dart';
import '../../domain/entities/number_trivia.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;

  NumberTriviaBloc({required this.getConcreteNumberTrivia})
    : super(NumberTriviaInitial()) {
    on<GetTriviaForConcreteNumber>((event, emit) async {
      emit(NumberTriviaLoading());
      final result = await getConcreteNumberTrivia(event.number);
      result.fold(
        (failure) =>
            emit(const NumberTriviaError(message: 'Something went wrong')),
        (trivia) => emit(NumberTriviaLoaded(trivia: trivia)),
      );
    });
  }
}
