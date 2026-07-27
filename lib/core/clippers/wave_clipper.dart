import 'dart:math';

import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double waveHeight = size.height * 0.2; // Bottom 20%
    final double waveCount = 2;
    final double waveLength = size.width / waveCount;

    // Start from top-left
    path.lineTo(0, 0);
    // Top-right
    path.lineTo(size.width, 0);
    // Bottom-right
    path.lineTo(size.width, size.height);

    // Draw two waves from right to left
    for (double x = size.width; x >= 0; x -= 1) {
      final double percent = (size.width - x) / waveLength;
      final double radians = percent * 2 * pi;
      final double verticalOffset = sin(radians) * (waveHeight * 0.3);
      final double y = size.height - waveHeight + verticalOffset;
      path.lineTo(x, y);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
