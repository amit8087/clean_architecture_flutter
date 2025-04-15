import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/number_trivia_bloc.dart';

class NumberTriviaScreen extends StatefulWidget {
  const NumberTriviaScreen({super.key});

  @override
  State<NumberTriviaScreen> createState() => _NumberTriviaScreenState();
}

class _NumberTriviaScreenState extends State<NumberTriviaScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Number Trivia')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Enter a number'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final number = int.tryParse(controller.text);
                if (number != null) {
                  context.read<NumberTriviaBloc>().add(
                    GetTriviaForConcreteNumber(number),
                  );
                }
              },
              child: const Text('Get Trivia'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
              builder: (context, state) {
                if (state is NumberTriviaInitial) {
                  return const Text('Enter a number to get trivia.');
                } else if (state is NumberTriviaLoading) {
                  return const CircularProgressIndicator();
                } else if (state is NumberTriviaLoaded) {
                  return Text(state.trivia.text);
                } else if (state is NumberTriviaError) {
                  return Text(state.message);
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}


// class NumberTriviaScreen extends StatefulWidget {
//   const NumberTriviaScreen({super.key});

//   @override
//   State<NumberTriviaScreen> createState() => _NumberTriviaScreenState();
// }

// class _NumberTriviaScreenState extends State<NumberTriviaScreen> {
//   final controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => sl<NumberTriviaBloc>(),
//       child: Scaffold(
//         appBar: AppBar(title: const Text('Number Trivia')),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               TextField(
//                 controller: controller,
//                 decoration: const InputDecoration(labelText: 'Enter a number'),
//                 keyboardType: TextInputType.number,
//               ),
//               const SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   final number = int.tryParse(controller.text);
//                   if (number != null) {
//                     context.read<NumberTriviaBloc>().add(
//                       GetTriviaForConcreteNumber(number),
//                     );
//                   }
//                 },
//                 child: const Text('Get Trivia'),
//               ),
//               const SizedBox(height: 20),
//               BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
//                 builder: (context, state) {
//                   if (state is NumberTriviaInitial) {
//                     return const Text('Enter a number to get trivia.');
//                   } else if (state is NumberTriviaLoading) {
//                     return const CircularProgressIndicator();
//                   } else if (state is NumberTriviaLoaded) {
//                     return Text(state.trivia.text);
//                   } else if (state is NumberTriviaError) {
//                     return Text(state.message);
//                   }
//                   return const SizedBox();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }