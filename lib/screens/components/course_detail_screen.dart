import 'package:flutter/material.dart';
import 'package:e_learning_app/model/product_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseDetailScreen extends StatelessWidget {
  final Product product;
  final Map<String, String> _roadmaps = {
    'UI/UX Design':
        'https://drive.google.com/file/d/1OsVyLr30jJEOl7WhRxx0AItxhZz3cX8E/view?usp=sharing',
    'Website Design': 'https://example.com/website-design-roadmap.pdf',
    'Figma': 'https://example.com/figma-roadmap.pdf',
    'Graphic Design':
        'https://drive.google.com/file/d/1OsVyLr30jJEOl7WhRxx0AItxhZz3cX8E/view?usp=drive_link',
    'Animation': 'https://example.com/animation-roadmap.pdf',
    'Cyber Security':
        'https://drive.google.com/file/d/1d2eAFqIlTGXG2ZIOZbelWtld8b31CWEr/view?usp=drivesdk',
    // Add more roadmaps here as needed
  };

  final Map<String, List<String>> _skills = {
    'UI/UX Design': ['UI/UX', 'Wireframing', 'Prototyping', 'User Testing'],
    'Website Design': ['HTML', 'CSS', 'JavaScript', 'Responsive Design'],
    'Figma': ['UI Design', 'Prototyping', 'Collaboration', 'Design Systems'],
    'Graphic Design': [
      'Adobe Photoshop',
      'Illustrator',
      'Branding',
      'Typography'
    ],
    'Animation': [
      '2D Animation',
      '3D Animation',
      'Motion Graphics',
      'Storyboarding'
    ],
    'Cyber Security': [
      'Network Security',
      'Cryptography',
      'Risk Management',
      'Ethical Hacking'
    ],
    // Add more skills here as needed
  };

  CourseDetailScreen({Key? key, required this.product}) : super(key: key);

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Fetch the appropriate roadmap URL and skills based on the product title
    final roadmapUrl = _roadmaps[product.title] ?? '';
    final skills = _skills[product.title] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  product.image,
                  height: 150,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  product.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tom Makesman",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "32 Lessons",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Certificate",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Text(
                      "4.8 (27 Reviews)",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Course Description:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Text(
                product.details ?? "No description available.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/tutor.jpg'),
                    radius: 30,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tom Makesman",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Design Tutor",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Skills",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children:
                    skills.map((skill) => Chip(label: Text(skill))).toList(),
              ),
              SizedBox(height: 20),
              Text(
                "Roadmap",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Text(
                "Here's the roadmap to guide you through the course.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (roadmapUrl.isNotEmpty) {
                      _launchURL(roadmapUrl);
                    } else {
                      // Handle case where roadmap URL is not found
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Roadmap not available.')),
                      );
                    }
                  },
                  icon: Icon(Icons.download),
                  label: Text("Download Roadmap"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text(
                      "\5000",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "GST included",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Enroll Now"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
