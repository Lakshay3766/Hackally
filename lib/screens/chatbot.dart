import 'package:flutter/material.dart';

class ChatBot extends StatefulWidget {
  final String username;
  final VoidCallback onClose;

  ChatBot({required this.username, required this.onClose});

  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  Map<String, String> get _responses {
    return {
      // Greetings
      'hi': 'Hello, ${widget.username}! How can I help you today?',
      'hello': 'Hi, ${widget.username}! What can I do for you?',
      'hey': 'Hey, ${widget.username}! How can I assist you?',
      'hiiii': 'Hello, ${widget.username}! How can I assist you today?',
      'hii': 'Hi, ${widget.username}! What can I help you with?',
      'goodbye': 'Goodbye, ${widget.username}! Have a great day!',
      'bye': 'Bye, ${widget.username}! See you soon!',
      'thanks':
          'You\'re welcome, ${widget.username}! If you need more help, just ask.',
      'thank you': 'No problem, ${widget.username}! Always here to help.',

      // Courses
      'what courses are available':
          'We have various courses available. Please check the categories section.',
      'list courses':
          'Here are some of the courses we offer: Programming, Data Science, Design, etc.',
      'course details':
          'For detailed information on courses, please visit the courses section on our website.',
      'how to enroll':
          'You can enroll in courses via the enroll section in your profile.',

      // Tutors
      'who are the tutors':
          'We have experienced tutors for each subject. Check the tutors section.',
      'tutor qualifications':
          'Our tutors are experts with qualifications in their respective fields.',
      'how to contact tutors':
          'You can contact tutors through the profile section or via the message feature.',

      // Hackathons
      'what are hackathons':
          'Hackathons are coding competitions where you can collaborate and create innovative solutions.',
      'upcoming hackathons':
          'Check out the events section for information on upcoming hackathons.',
      'how to participate in hackathons':
          'You can register for hackathons via the registration section on our website.',
      'past hackathons':
          'Visit the archive section to view past hackathons and their details.',
      'hackathon benefits':
          'Participating in hackathons helps improve your skills and network with other professionals.',

      // Competitions
      'what competitions are available':
          'We offer various competitions in coding, design, and more. Check the competitions section.',
      'how to participate in competitions':
          'Register through the competitions section on our site.',
      'benefits of competitions':
          'Competitions help you showcase your skills and win prizes.',
      'current competitions':
          'Visit the competitions section to see the current ongoing competitions.',

      // Programming
      'what programming languages are taught':
          'We cover a range of programming languages including Python, Java, and Dart.',
      'programming tutorials':
          'Find tutorials and learning materials in the programming section.',
      'how to start learning programming':
          'You can start learning programming by enrolling in our introductory courses.',
      'advanced programming courses':
          'We offer advanced courses for those looking to deepen their programming knowledge.',

      // Contact & Support
      'how to contact support':
          'You can contact support through the help section on the profile screen.',
      'support hours':
          'Our support team is available 24/7 to assist you with any issues.',
      'feedback':
          'You can provide feedback via the feedback section on our website.',

      // Default Response
      'default': 'API not connected yet.',
    };
  }

  void _handleMessage(String message) {
    final response =
        _responses[message.toLowerCase()] ?? _responses['default']!;
    setState(() {
      _messages.add('Bot: $response'); // Add bot response first
      _messages.add('User: $message'); // Then add user message
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400, // Fixed height
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ChatBot',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: widget.onClose,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              reverse: true, // Scroll to the bottom
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUserMessage = message.startsWith('User');

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Align(
                    alignment: isUserMessage
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: isUserMessage
                            ? Colors.deepPurple
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text(
                        message,
                        style: TextStyle(
                          color: isUserMessage ? Colors.white : Colors.black87,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    style: TextStyle(color: Colors.black87),
                    onSubmitted: _handleMessage,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.deepPurple),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _handleMessage(_controller.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
