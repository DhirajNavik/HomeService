import 'package:flutter/material.dart';

class AnimationSwitch extends StatelessWidget {
  final Widget child;

  const AnimationSwitch({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 320),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) {
        final fadeAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
          reverseCurve: Curves.easeIn,
        );
        final clickedAnimation = Tween<double>(
          begin: 0.5,
          end: 1,
        ).animate(fadeAnimation);
        return FadeTransition(
          opacity: fadeAnimation,
          child: ScaleTransition(scale: clickedAnimation, child: child),
        );
      },
      child: child,
    );
  }
}