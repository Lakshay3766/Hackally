import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({Key? key}) : super(key: key);

  @override
  _LearnScreenState createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  int currentStep = 0;
  bool isCorrect = false;
  bool isAnswered = false;

  void checkAnswer(bool answer) {
    setState(() {
      isAnswered = true;
      isCorrect = answer;
    });
  }

  void nextQuestion() {
    setState(() {
      currentStep++;
      isAnswered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircularPercentIndicator(
                radius: 50.0,
                lineWidth: 5.0,
                percent: currentStep / 4,
                center: Text("${(currentStep / 4 * 100).toInt()}%"),
                progressColor: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Learn Sundanese',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (currentStep == 0) ...[
              buildCourseSection(
                context,
                'Level 1',
                'Introduction',
                '1 Hour 30 Minute',
                0.5,
                Colors.green,
              ),
              const SizedBox(height: 10),
              buildCourseSection(
                context,
                'Level 2',
                'Grammar',
                '1 Hour 45 Minute',
                0.4,
                Colors.orange,
              ),
              const SizedBox(height: 10),
              buildCourseSection(
                context,
                'Level 3',
                'Vocabulary',
                '1 Hour 25 Minute',
                0.2,
                Colors.red,
              ),
              const SizedBox(height: 20),
              buildPersonalizedAISection(),
              Spacer(),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      currentStep++;
                    });
                  },
                  child: Text(
                    'Learn Now',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ] else if (currentStep == 1) ...[
              buildQuizSection(
                context,
                'What does the picture mean?',
                'assets/images/your_image.png', // replace with your image
                ['Sampeyan', 'Soca', 'Cepil', 'Pangambung'],
                3,
                isAnswered,
                isCorrect,
                checkAnswer,
                nextQuestion,
              ),
            ] else if (currentStep == 2) ...[
              buildQuizSection(
                context,
                'What does the picture mean?',
                'assets/images/your_image.png', // replace with your image
                ['Sampeyan', 'Soca', 'Cepil', 'Pangambung'],
                2,
                isAnswered,
                !isCorrect,
                checkAnswer,
                nextQuestion,
              ),
            ] else if (currentStep == 3) ...[
              buildTestSection(
                context,
                'What’s the meaning of this sentence?',
                'Punten, Nami abdi Asep',
                'Excuse me, my name is Asep',
              ),
            ] else if (currentStep == 4) ...[
              buildTestCheckSection(
                context,
                'What’s the meaning of this sentence?',
                'Punten, Nami abdi Asep',
                'Excuse me, my name is Asep',
              ),
            ],
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildCourseSection(
    BuildContext context,
    String level,
    String title,
    String duration,
    double progress,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Text(
              level,
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  duration,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: progress,
                  color: color,
                  backgroundColor: color.withOpacity(0.3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildQuizSection(
    BuildContext context,
    String question,
    String imagePath,
    List<String> options,
    int correctIndex,
    bool isAnswered,
    bool isCorrect,
    Function(bool) onAnswerSelected,
    void Function() onNextQuestion,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Center(
          child: Image.asset(
            imagePath,
            height: 150,
          ),
        ),
        const SizedBox(height: 20),
        ...options.asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value;
          bool isCorrectOption = index == correctIndex;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isAnswered
                    ? (isCorrectOption
                        ? (isCorrect ? Colors.green : Colors.red)
                        : Colors.grey)
                    : Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
              onPressed: isAnswered
                  ? null
                  : () {
                      onAnswerSelected(isCorrectOption);
                    },
              child: Text(
                option,
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        }).toList(),
        const SizedBox(height: 20),
        if (isAnswered) ...[
          Text(
            isCorrect
                ? 'Amazing! Answer: ${options[correctIndex]}'
                : 'Ups.. that\'s wrong\nAnswer: ${options[correctIndex]}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isCorrect ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              ),
              onPressed: onNextQuestion,
              child: Text(
                'Next Question',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget buildTestSection(
    BuildContext context,
    String question,
    String sentence,
    String translation,
  ) {
    TextEditingController controller = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Center(
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              sentence,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Your answer',
          ),
          maxLines: null,
          keyboardType: TextInputType.multiline,
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            ),
            onPressed: () {
              // Add your logic to check the answer
              setState(() {
                currentStep++;
              });
            },
            child: Text(
              'Check Answer',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTestCheckSection(
    BuildContext context,
    String question,
    String sentence,
    String translation,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Center(
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              sentence,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: translation,
          ),
          maxLines: null,
          keyboardType: TextInputType.multiline,
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            ),
            onPressed: () {
              // Add your logic to check the answer
              setState(() {
                currentStep = 0;
              });
            },
            child: Text(
              'Next Question',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPersonalizedAISection() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AI Personalized Courses Recommended for You',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          buildCourseCard(
            context,
            'Programming 101',
            'An introduction to programming concepts',
            '2 Hours',
            Colors.blue,
          ),
          const SizedBox(height: 10),
          buildCourseCard(
            context,
            'Advanced Flutter',
            'Deep dive into Flutter development',
            '3 Hours',
            Colors.green,
          ),
          const SizedBox(height: 10),
          buildCourseCard(
            context,
            'Machine Learning Basics',
            'Understanding machine learning fundamentals',
            '2.5 Hours',
            Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget buildCourseCard(
    BuildContext context,
    String title,
    String description,
    String duration,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(Icons.book, color: Colors.white),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  duration,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
