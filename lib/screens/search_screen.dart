import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_learning_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Import for GestureDetector and TapGestureRecognizer
import 'package:url_launcher/url_launcher.dart'; // Import for URL launching
import 'components/appbar.dart';
import 'components/category.dart';
import 'components/sorting.dart';
import 'learn_screen.dart'; // Import the learn screen
import 'achievement_screen.dart'; // Import the achievement screen
import 'profile_screen.dart'; // Import the profile screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Learning App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreenContent(), // Home screen content
    LearnScreen(), // Learn screen content
    SearchScreen(), // Search screen content
    AchievementScreen(), // Achievement screen content
    ProfileScreen(), // Profile screen content
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: kpink,
            inactiveColor: Colors.grey[300],
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.book),
            title: Text('Learn'),
            activeColor: kpink,
            inactiveColor: Colors.grey[300],
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
            activeColor: kpink,
            inactiveColor: Colors.grey[300],
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.emoji_events),
            title: Text('Achievement'),
            activeColor: kpink,
            inactiveColor: Colors.grey[300],
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            activeColor: kpink,
            inactiveColor: Colors.grey[300],
          ),
        ],
      ),
      body: SafeArea(
        child: _screens[_selectedIndex],
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomeAppBar(),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hi Khushi",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Today is a good day\nto learn something new!",
                        style: TextStyle(
                          color: Colors.black54,
                          wordSpacing: 2.5,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: kpurple,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Image.asset("assets/images/profile.png"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Sorting(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "See All",
                      style: TextStyle(fontSize: 16, color: kblue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CategoryList(),
              const SizedBox(height: 20),
            ],
          ),
        )
      ],
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  bool _noResults = false;
  bool _noNetwork = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Language...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _isSearching = value.isNotEmpty;
                  _noResults = false;
                  _noNetwork = false;
                });
              },
            ),
            const SizedBox(height: 20),
            if (_noNetwork) ...[
              NoNetworkScreen(),
            ] else if (_noResults) ...[
              NotFoundScreen(),
            ] else if (_isSearching) ...[
              Expanded(
                child: ListView(
                  children: [
                    LanguageTile(
                      title: 'Sundanese',
                      category: 'Introduction',
                      image: 'assets/images/sundanese.png',
                    ),
                    LanguageTile(
                      title: 'Javanese',
                      category: 'Grammar',
                      image: 'assets/images/javanese.png',
                    ),
                    LanguageTile(
                      title: 'Minangkabau',
                      category: 'Pronunciation',
                      image: 'assets/images/minangkabau.png',
                    ),
                  ],
                ),
              ),
            ] else ...[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Previous Language Courses',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    LanguageTile(
                      title: 'Sundanese',
                      category: 'Introduction',
                      image: 'assets/images/sundanese.png',
                    ),
                    LanguageTile(
                      title: 'Balinese',
                      category: 'Grammar',
                      image: 'assets/images/balinese.png',
                    ),
                    LanguageTile(
                      title: 'Aceh',
                      category: 'Pronunciation',
                      image: 'assets/images/aceh.png',
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class LanguageTile extends StatelessWidget {
  final String title;
  final String category;
  final String image;

  const LanguageTile({
    Key? key,
    required this.title,
    required this.category,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(image, width: 50),
      title: Text(title),
      subtitle: Text(category),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LanguageDetailScreen(
              title: title,
              category: category,
              image: image,
            ),
          ),
        );
      },
    );
  }
}

class LanguageDetailScreen extends StatelessWidget {
  final String title;
  final String category;
  final String image;

  const LanguageDetailScreen({
    Key? key,
    required this.title,
    required this.category,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(image, height: 200),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(Icons.group),
                    Text('120'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.timeline),
                    Text('Progress'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.favorite),
                    Text('Fav'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.more_horiz),
                    Text('More'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Minangkabau, or Basa Minang in its native language, is an Austronesian language spoken by the Minangkabau people in West Sumatra and western Riau, as well as by those who have migrated to other cities in Indonesia.',
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'You can watch a related video here: ',
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final url =
                            'https://www.youtube.com/watch?v=dQw4w9WgXcQ';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Learn Language'),
            ),
          ],
        ),
      ),
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 100, color: Colors.grey),
          const SizedBox(height: 20),
          Text(
            'Not Found',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class NoNetworkScreen extends StatelessWidget {
  const NoNetworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off, size: 100, color: Colors.grey),
          const SizedBox(height: 20),
          Text(
            'Not Connected',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Ups. You are not connected to internet! Try again',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
