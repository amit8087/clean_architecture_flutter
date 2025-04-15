import 'package:clean_architecture_flutter/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:clean_architecture_flutter/features/number_trivia/presentation/screens/number_trivia_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<NumberTriviaBloc>(),
      child: MaterialApp(
        title: 'Number Trivia',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: const NumberTriviaScreen(),
      ),
    );
  }
}
