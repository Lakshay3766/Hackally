import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AchievementScreen extends StatelessWidget {
  const AchievementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Achievements'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Progress and Summary Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircularPercentIndicator(
                    radius: 50.0,
                    lineWidth: 8.0,
                    percent: 0.8,
                    center: Text("80%"),
                    progressColor: Colors.green,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Achievements: 20',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Great job, John! Complete your achievements now.',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Achievements List
            Expanded(
              child: ListView(
                children: [
                  AchievementTile(
                    title: 'Studious',
                    description: 'You have completed this lesson 10 times.',
                    color: Colors.lightBlue,
                    stars: 4,
                  ),
                  AchievementTile(
                    title: 'Quickie',
                    description:
                        'You have completed this quiz in less than 3 minutes, 10 times.',
                    color: Colors.yellow,
                    stars: 3,
                  ),
                  AchievementTile(
                    title: 'Ambitious',
                    description: 'You have achieved 15 milestones.',
                    color: Colors.orange,
                    stars: 4,
                  ),
                  AchievementTile(
                    title: 'Perfectionist',
                    description: 'You have scored 100% on quizzes 20 times.',
                    color: Colors.teal,
                    stars: 5,
                  ),
                  SizedBox(height: 16),
                  CertificationSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AchievementTile extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final int stars;

  const AchievementTile({
    Key? key,
    required this.title,
    required this.description,
    required this.color,
    required this.stars,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(Icons.star, color: Colors.white),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,
                color: index < stars ? color : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CertificationSection extends StatefulWidget {
  @override
  _CertificationSectionState createState() => _CertificationSectionState();
}

class _CertificationSectionState extends State<CertificationSection> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Certifications',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          AnimatedCrossFade(
            firstChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CertificationTile(
                  title: 'Flutter Developer',
                  description: 'Completed advanced Flutter course.',
                  date: 'June 2024',
                  color: Colors.blue,
                ),
                CertificationTile(
                  title: 'Data Structures & Algorithms',
                  description: 'Mastered fundamental data structures.',
                  date: 'May 2024',
                  color: Colors.green,
                ),
              ],
            ),
            secondChild: Container(),
            crossFadeState: isExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: Duration(milliseconds: 300),
          ),
          SizedBox(height: 8),
          TextButton(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded ? 'Show Less' : 'Show More',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

class CertificationTile extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final Color color;

  const CertificationTile({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Date: $date',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
