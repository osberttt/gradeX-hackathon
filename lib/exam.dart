import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:pala_hackathon/results.dart';

const String url = 'http://127.0.0.1:5000/api/exam';

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
  ExamPage({super.key, required this.questionNumber});
  @override
  _ExamPageState createState() => _ExamPageState(questionNumber);
}

class _ExamPageState extends State<ExamPage> {
  String answer = "";

  final int question_number;
  _ExamPageState(this.question_number);

  Future<http.Response>? _dataFuture;
  void _fetchData() {
    setState(() {
      _dataFuture = getData(question_number);
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
      body: Column(
        children: [
          FutureBuilder<http.Response>(
            future: _dataFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final response = snapshot.data!;
                var data = json.decode(response.body);
                // Display data using ListView or other widgets
                return Text(
                  "${question_number + 1}  ${data['question']}",
                  style: const TextStyle(fontSize: 18.0),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              //Display a loading indicator while waiting for data
              return const CircularProgressIndicator();
            },
          ),
          const SizedBox(height: 10.0),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Answer',
            ),
            onChanged: (value) => setState(() => answer = value),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: question_number == 2
                ? () {
                    final data = {"answer": answer};
                    postData(data);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ResultsPage()));
                  }
                : () {
                    final data = {"answer": answer};
                    postData(data);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExamPage(
                                  questionNumber: question_number + 1,
                                )));
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Colors.blue.withOpacity(0.5), // Grayed out button
            ),
            child: Text(question_number == 2 ? 'See Results' : 'Next Question'),
          ),
        ],
      ),
    );
  }
}
