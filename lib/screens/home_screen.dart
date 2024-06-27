import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../localization/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final List<String> images = const [
    'https://source.unsplash.com/random/600x400?nature',
    'https://source.unsplash.com/random/600x400?water',
    'https://source.unsplash.com/random/600x400?forest',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.translate('home') ?? 'Home'),
      ),
      body: Center(
        child: CardSwiper(
          cards: images.map((image) {
            return Image.network(
              image,
              fit: BoxFit.fill,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              },
              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                return const Center(
                  child: Icon(Icons.error, size: 50, color: Colors.red),
                );
              },
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
