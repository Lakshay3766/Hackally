import 'package:flutter/material.dart';
import 'course_detail_screen.dart';
import 'package:e_learning_app/model/product_model.dart'; // Ensure the import is correct

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // Prevents scrolling conflicts
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 10.0, // Adds spacing between columns
        mainAxisSpacing: 10.0, // Adds spacing between rows
      ),
      itemBuilder: (context, index) => CategoryCard(
        product: products[index],
      ),
    );
  }
}

class CategoryCard extends StatefulWidget {
  const CategoryCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, // Set a fixed height to avoid overflow
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    CourseDetailScreen(product: widget.product),
              ),
            );
          },
          child: MouseRegion(
            onEnter: (_) => _onHover(true),
            onExit: (_) => _onHover(false),
            child: ScaleTransition(
              scale:
                  Tween<double>(begin: 1.0, end: 1.05).animate(CurvedAnimation(
                parent: _controller,
                curve: Curves.easeInOut,
              )),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: widget.product.color,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: isHovered
                      ? [BoxShadow(color: Colors.black26, blurRadius: 10.0)]
                      : [],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Ensures content is centered
                  children: [
                    Expanded(
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: isHovered ? 0.8 : 1.0,
                        child: Image.asset(
                          widget.product.image,
                          fit: BoxFit
                              .contain, // Ensures image scales appropriately
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.product.title,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center, // Centers text
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${widget.product.courses} courses",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center, // Centers text
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onHover(bool hover) {
    setState(() {
      isHovered = hover;
      if (hover) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }
}
