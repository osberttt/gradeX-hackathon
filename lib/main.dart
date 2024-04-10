import 'package:flutter/material.dart';
import 'package:pala_hackathon/exam.dart';

void main() {
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ICT 102 Computer Programming I'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExamPage(
                              questionNumber: 0,
                            )));
              },
              child: const Text('Start')),
        ));
  }
}
