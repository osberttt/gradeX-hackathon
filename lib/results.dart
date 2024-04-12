import 'dart:convert' show json;

import 'package:flutter/material.dart';
import 'package:gradeX_hackathon/exam.dart';
import 'package:http/http.dart' as http;

const String url = 'http://127.0.0.1:5000/api/results';

Future<http.Response> getResults() async {
  final response = await http.get(
    Uri.parse(url),
  );
  return response;
}

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ICT 102 Computer Programming I'),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Column(children: [
            results(),
            const SizedBox(
              height: 30.0,
            ),
            restartButton(context)
          ]),
        )));
  }

  ElevatedButton restartButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ExamPage(
                        questionNumber: 0,
                      )));
        },
        child: const Text('Restart'));
  }

  FutureBuilder<http.Response> results() {
    return FutureBuilder<http.Response>(
        future: getResults(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final response = snapshot.data!;
            final data = json.decode(response.body)['results'];
            var formatedData = [];
            for (int i = 0; i < data['answers'].length; i++) {
              formatedData.add({
                'no': i + 1,
                'question': data['questions'][i],
                'answer': data['answers'][i],
                'rating': data['ratings'][i]
              });
            }

            return Column(children: [
              DataTable(
                columns: const [
                  DataColumn(
                      label: Text('No.', style: TextStyle(fontSize: 14.0))),
                  DataColumn(
                      label:
                          Text('Question', style: TextStyle(fontSize: 14.0))),
                  DataColumn(
                      label: Text('Answer', style: TextStyle(fontSize: 14.0))),
                  DataColumn(
                      label: Text('Rating', style: TextStyle(fontSize: 14.0))),
                ],
                rows: formatedData.map((item) => _buildDataRow(item)).toList(),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Text(data['feedbacks'])
            ]);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          // Display a loading indicator while waiting for data
          return const Column(
            children: [
              SizedBox(
                height: 100.0,
              ),
              CircularProgressIndicator(),
            ],
          );
        });
  }

  DataRow _buildDataRow(Map<String, dynamic> item) {
    return DataRow(
      cells: [
        DataCell(Text(item['no'].toString())),
        DataCell(Text(item['question'])),
        DataCell(Text(item['answer'])),
        DataCell(Text(item['rating'].toString())),
      ],
    );
  }
}
