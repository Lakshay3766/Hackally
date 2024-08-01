import 'dart:math';
import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final int id, courses;
  final Color color;
  final String? details; // Add this field

  Product({
    required this.image,
    required this.title,
    required this.courses,
    required this.color,
    required this.id,
    this.details, // Add this parameter
  });
}

final List<String> images = [
  "assets/images/graphics.png",
  "assets/images/programming.png",
  "assets/images/finance.png",
  "assets/images/ux.png",
];

String getRandomImage() {
  final random = Random();
  return images[random.nextInt(images.length)];
}

List<Product> products = [
  Product(
    id: 1,
    title: "Graphic Design",
    image: "assets/images/graphics.png",
    color: Color(0xFF71b8ff),
    courses: 16,
    details:
        "Learn the fundamentals of graphic design, including color theory, typography, and software tools.",
  ),
  Product(
    id: 2,
    title: "Programming",
    image: "assets/images/programming.png",
    color: Color(0xFFff6374),
    courses: 22,
    details:
        "Master programming languages and development frameworks with hands-on projects.",
  ),
  Product(
    id: 3,
    title: "Finance",
    image: "assets/images/finance.png",
    color: Color(0xFFffaa5b),
    courses: 15,
    details:
        "Explore financial concepts, investment strategies, and market analysis techniques.",
  ),
  Product(
    id: 4,
    title: "UI/UX Design",
    image: "assets/images/ux.png",
    color: Color(0xFF9ba0fc),
    courses: 18,
    details:
        "Understand user interface and user experience design principles to create intuitive products.",
  ),
  Product(
    id: 5,
    title: "Web Development",
    image: getRandomImage(),
    color: Color(0xFF4caf50),
    courses: 25,
    details:
        "Build modern, responsive websites using HTML, CSS, JavaScript, and frameworks.",
  ),
  Product(
    id: 6,
    title: "Data Science",
    image: getRandomImage(),
    color: Color(0xFFf44336),
    courses: 20,
    details:
        "Analyze and interpret complex data to make informed decisions and predictions.",
  ),
  Product(
    id: 7,
    title: "Mobile",
    image: getRandomImage(),
    color: Color(0xFF3f51b5),
    courses: 19,
    details:
        "Create mobile applications for iOS and Android using native and cross-platform technologies.",
  ),
  Product(
    id: 8,
    title: "Cyber Security",
    image: getRandomImage(),
    color: Color(0xFF9c27b0),
    courses: 14,
    details:
        "Learn about protecting systems and data from cyber threats and vulnerabilities.",
  ),
  Product(
    id: 9,
    title: "Machine Learning",
    image: getRandomImage(),
    color: Color(0xFFff9800),
    courses: 21,
    details:
        "Implement machine learning algorithms and models to solve complex problems.",
  ),
  Product(
    id: 10,
    title: "Cloud Computing",
    image: getRandomImage(),
    color: Color(0xFF00bcd4),
    courses: 17,
    details:
        "Understand cloud services and architectures to deploy and manage scalable applications.",
  ),
  Product(
    id: 11,
    title: "Unity 3D",
    image: getRandomImage(),
    color: Color(0xFF8bc34a),
    courses: 12,
    details:
        "Design and develop interactive games using various game development tools and techniques.",
  ),
  Product(
    id: 12,
    title: "AI",
    image: getRandomImage(),
    color: Color(0xFFe91e63),
    courses: 23,
    details:
        "Explore AI concepts, including neural networks, natural language processing, and more.",
  ),
];
