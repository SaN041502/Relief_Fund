// ignore_for_file: unused_field, avoid_print

import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:relief_fund/pages/homepage.dart';
import 'package:relief_fund/widgets/colors.dart';
import 'package:relief_fund/widgets/messages.dart';
import 'package:relief_fund/widgets/qna.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

final apiKey = dotenv.env['BOT_API_KEY'];

class _ChatBotState extends State<ChatBot> {
  List<Map<String, dynamic>> messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //store qna globally
  List<QnA> allQnA = [];

  //fetch qna
  Future<List<QnA>> fetchQnA() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('qna').get();
    return querySnapshot.docs
        .map((doc) => QnA.fromFirestore(doc.data()))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    fetchQnA().then((data) {
      setState(() {
        allQnA = data;
      });
    });
  }

  Future<List<double>> getEmbedding(String input) async {
    final url = Uri.parse("http://192.168.0.220:5000/embed");

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"text": input}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<double>.from(data['embedding']);
    } else {
      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to get embedding');
    }
  }

  double cosineSimilarity(List<double> a, List<double> b) {
    double dotProduct = 0;
    double magA = 0;
    double magB = 0;

    for (int i = 0; i < a.length; i++) {
      dotProduct += a[i] * b[i];
      magA += a[i] * a[i];
      magB += b[i] * b[i];
    }

    return dotProduct / (sqrt(magA) * sqrt(magB));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryColor, AppColors.secondaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Assistant Bot',
          style: TextStyle(
            color: AppColors.backgroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Homepage()),
            );
          },
          icon: Icon(Icons.arrow_back, color: AppColors.backgroundColor),
        ),
      ),

      // Body
      body: Column(
        children: [
          // The message list
          Expanded(child: Messages(messages: messages)),

          // User input field
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryColor, AppColors.secondaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.07,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: AppColors.backgroundColor),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 15,
                        bottom: 11,
                        top: 11,
                      ),
                      hintText: "Ask your question",
                      hintStyle: TextStyle(
                        color: const Color.fromARGB(83, 245, 245, 245),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final userInput = _controller.text;
                    final userEmbedding = await getEmbedding(userInput);

                    QnA? bestMatch;
                    double highestSim = -1;

                    for (var qna in allQnA) {
                      final sim = cosineSimilarity(
                        userEmbedding,
                        qna.embedding,
                      );
                      if (sim > highestSim) {
                        highestSim = sim;
                        bestMatch = qna;
                      }
                    }

                    setState(() {
                      messages.add({
                        'message': userInput,
                        'isUserMessage': true,
                      });
                      messages.add({
                        'message':
                            (bestMatch != null && highestSim > 0.7)
                                ? bestMatch.ans
                                : "Sorry, I don’t understand.Please contact with our support team for further instruction.You can find our contact details by following these steps:Click on the three horizontal lines (☰) at the top left corner of the homepage.Select 'Contact Us' from the menu.",
                        'isUserMessage': false,
                      });
                    });

                    _controller.clear();
                  },
                  icon: Icon(Icons.send, color: AppColors.backgroundColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
