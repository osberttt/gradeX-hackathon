import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:gradeX_hackathon/results.dart';

const String url = 'http://127.0.0.1:5000/api/exam';

const int numberOfQuestions = 3;
Future<http.Response> postData(Map<String, dynamic> data) async {
  final response = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: json.encode(data),
  );
  return response;
}

Future<http.Response> getData(int number) async {
  final response = await http.get(
    Uri.parse('$url?number=$number'),
    headers: {"Content-Type": "application/json"},
  );
  return response;
}

class ExamPage extends StatefulWidget {
  final int questionNumber;
  const ExamPage({super.key, required this.questionNumber});
  @override
  ExamPageState createState() => ExamPageState(questionNumber);
}

class ExamPageState extends State<ExamPage> {
  String answer = "";

  final int questionNumber;
  ExamPageState(this.questionNumber);

  Future<http.Response>? _dataFuture;
  void _fetchData() {
    setState(() {
      _dataFuture = getData(questionNumber);
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ICT 102 Computer Programming I'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50.0),
            questionFuture(),
            const SizedBox(height: 10.0),
            answerField(),
            const SizedBox(height: 20.0),
            submitButton(context),
          ],
        ),
      ),
    );
  }

  ElevatedButton submitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: questionNumber == numberOfQuestions - 1
          ? () {
              final data = {"answer": answer};
              postData(data);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ResultsPage()));
            }
          : () {
              final data = {"answer": answer};
              postData(data);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExamPage(
                            questionNumber: questionNumber + 1,
                          )));
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.withOpacity(0.5), // Grayed out button
      ),
      child: Text(questionNumber == 2 ? 'See Results' : 'Next Question'),
    );
  }

  Container answerField() {
    return Container(
      width: 400.0,
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        maxLines: 5,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: '',
        ),
        onChanged: (value) => setState(() => answer = value),
      ),
    );
  }

  FutureBuilder<http.Response> questionFuture() {
    return FutureBuilder<http.Response>(
      future: _dataFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final response = snapshot.data!;
          var data = json.decode(response.body);
          // Display data using ListView or other widgets
          return Text(
            "${questionNumber + 1}  ${data['question']}",
            style: const TextStyle(fontSize: 18.0),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        //Display a loading indicator while waiting for data
        return const CircularProgressIndicator();
      },
    );
  }
}
