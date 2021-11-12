import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutternewsrealm/view/widgets/carousel_item.dart';
import 'package:flutternewsrealm/view/widgets/news_item.dart';

class SharedScreen extends StatefulWidget {
  final String title;

  const SharedScreen(this.title, {Key? key}) : super(key: key);

  @override
  _SharedScreenState createState() => _SharedScreenState();
}

class _SharedScreenState extends State<SharedScreen> {
  final List<Widget> _newsItemSliders = [
    const CarouselItem(),
    const CarouselItem(),
    const CarouselItem(),
  ];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          carousel(),
          newsList(),
        ],
      ),
    );
  }

  Widget carousel() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2,
            autoPlayInterval: const Duration(seconds: 8),
            enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          carouselController: _controller,
          items: _newsItemSliders,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _newsItemSliders.asMap().entries.map((e) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(e.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.red)
                        .withOpacity(_current == e.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget newsList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, int index) {
        return const NewsItem();
      },
    );
  }
}
