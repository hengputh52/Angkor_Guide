import 'package:flutter/material.dart';

class FadeSlide extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Offset begin;
  const FadeSlide({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.begin = const Offset(0, 0.3),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(begin: begin, end: Offset.zero),
      duration: duration,
      builder: (context, offset, child) => Opacity(
        opacity: 1 - (offset).distance,
        child: Transform.translate(
          offset: Offset(0, (offset).dy * 100),
          child: child,
        ),
      ),
      child: child,
    );
  }
}
