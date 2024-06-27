import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final List<String> images = const [
    'https://via.placeholder.com/600/92c952',
    'https://via.placeholder.com/600/771796',
    'https://via.placeholder.com/600/24f355',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Herd Home'),
      ),
      body: Center(
        child: CardSwiper(
          cards: images.map((image) {
            return Image.network(
              image,
              fit: BoxFit.fill,
            );
          }).toList(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          duration: const Duration(milliseconds: 200),
          maxAngle: 30,
          threshold: 50,
          scale: 0.9,
        ),
      ),
    );
  }
}
