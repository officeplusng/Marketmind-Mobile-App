import 'package:flutter/material.dart';
import 'package:marketmind/core/assets/assets.dart';

class PageLoader extends StatefulWidget {
  final double size;

  const PageLoader({
    super.key,
    this.size = 60,
  });

  @override
  State<PageLoader> createState() => _PageLoaderState();
}

class _PageLoaderState extends State<PageLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // speed of pulsing
      lowerBound: 0.9, // min scale
      upperBound: 1.1, // max scale
    )..repeat(reverse: true); // repeat with bounce effect
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _controller,
        child: Image.asset(
          Assets.loadingState,
          width: widget.size,
          height: widget.size,
        ),
      ),
    );
  }
}
