import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HackathonScreen extends StatelessWidget {
  const HackathonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Browse Categories'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Team Up With Other Students Section
            Text(
              'Team Up With Other Students',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16),
            _buildTeamUpCard(
                'Collaborate on Projects',
                'Find students with similar interests to work on exciting projects together. Share ideas, build solutions, and learn from each other.',
                'assets/images/collaborate.png' // Replace with your image asset path
                ),
            _buildTeamUpCard(
                'Join Study Groups',
                'Join or create study groups to prepare for exams or learn new technologies. Collaborate with peers to achieve your academic goals.',
                'assets/images/study_group.png' // Replace with your image asset path
                ),
            _buildTeamUpCard(
                'Participate in Workshops',
                'Attend workshops and seminars to expand your knowledge and network with other students. Stay updated on the latest trends and technologies.',
                'assets/images/workshops.png' // Replace with your image asset path
                ),
            const SizedBox(height: 32),

            // Latest Jobs Section
            Text(
              'Latest Jobs',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16),
            _buildJobCard(
                'App Developer',
                'XYZ Company',
                'App Developer at XYZ Company with experience in Flutter, React Native, and mobile application development. Apply directly using the link below.',
                'https://www.example.com/app-developer-apply'),
            _buildJobCard(
                'Web Developer',
                'XYZ Company',
                'Web Developer at XYZ Company specializing in front-end technologies including React, Angular, and Vue.js. Apply directly using the link below.',
                'https://www.example.com/web-developer-apply'),
            const SizedBox(height: 32),

            // Latest Hackathons Section
            Text(
              'Latest Hackathons',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16),
            _buildHackathonCard(
                'Hack4Change',
                'Participating in this hackathon to create innovative solutions for social impact. More details and images coming soon.',
                'assets/images/hack4change.png' // Replace with your image asset path
                ),
            _buildHackathonCard('Hackathon 2', 'Date 2',
                'assets/images/hackathon2.png' // Replace with your image asset path
                ),
            _buildHackathonCard('Hackathon 3', 'Date 3',
                'assets/images/hackathon3.png' // Replace with your image asset path
                ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamUpCard(String title, String description, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: Image.asset(
          imagePath,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        title: Text(title),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }

  Widget _buildJobCard(
      String jobTitle, String companyName, String details, String applyLink) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(jobTitle),
        subtitle: Text(companyName),
        contentPadding: EdgeInsets.all(16.0),
        trailing: IconButton(
          icon: Icon(Icons.open_in_new),
          onPressed: () {
            // Open the apply link in the browser
            _launchURL(applyLink);
          },
        ),
        isThreeLine: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
        subtitleTextStyle: TextStyle(color: Colors.black54),
      ),
    );
  }

  Widget _buildHackathonCard(
      String hackathonName, String description, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: Image.asset(
          imagePath,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        title: Text(hackathonName),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
