class QnA {
  final String ques;
  final String ans;
  final List<double> embedding;

  QnA({required this.ques, required this.ans, required this.embedding});

  factory QnA.fromFirestore(Map<String, dynamic> data) {
    return QnA(
      ques: data['ques'] ?? '',
      ans: data['ans'] ?? '',
      embedding: List<double>.from(data['embedding'] ?? []),
    );
  }
}
