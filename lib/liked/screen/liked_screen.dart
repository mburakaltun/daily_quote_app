import 'package:flutter/material.dart';

class LikedScreen extends StatelessWidget {
  const LikedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Liked Quotes",
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}
