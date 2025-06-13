import 'dart:math';

import 'package:flutter/material.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';

class SlidingColumnGrid extends StatefulWidget {
  final int columns;
  final List<IconData> icons;
  final double iconSize;
  final double gap;
  final Duration duration;

  const SlidingColumnGrid({
    super.key,
    required this.icons,
    this.columns = 3,
    this.iconSize = 40,
    this.gap = 12,
    this.duration = const Duration(seconds: 20),
  });

  @override
  State<SlidingColumnGrid> createState() => _SlidingColumnGridState();
}

class _SlidingColumnGridState extends State<SlidingColumnGrid>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            left: -50,
            child: SizedBox(
              width: MediaQuery.of(context).size.width + 50,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.columns,
                  mainAxisSpacing: widget.gap,
                  crossAxisSpacing: widget.gap,
                ),
                itemCount: widget.icons.length * 4,
                itemBuilder: (context, index) {
                  final actualIndex = index % widget.icons.length;
                  final isEvenColumn = (index % widget.columns) % 2 == 0;
                  return _AnimatedGridItem(
                    icon: widget.icons[actualIndex],
                    size: widget.iconSize,
                    animation: _animation,
                    startFromTop: isEvenColumn,
                    columnHeight: _calculateColumnHeight(widget.columns),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _calculateColumnHeight(int columns) {
    final itemsInColumn = (widget.icons.length / columns).ceil();
    return itemsInColumn * (98 + widget.gap);
  }
}

class _AnimatedGridItem extends StatelessWidget {
  final IconData icon;
  final double size;
  final Animation<double> animation;
  final bool startFromTop;
  final double columnHeight;

  const _AnimatedGridItem({
    required this.icon,
    required this.size,
    required this.animation,
    required this.startFromTop,
    required this.columnHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        // Calculate progress with offset for staggered animation
        final progress = animation.value * 0.4;

        // Add bounce effect at the end of animation
        final bounceEffect = sin(progress * 2 * 3.14159) * 0.1;

        // Calculate translation based on direction
        final translation =
            startFromTop
                ? -columnHeight + progress * columnHeight * 2
                : -columnHeight - progress * columnHeight * 2;

        return Transform.translate(
          offset: Offset(0, translation + bounceEffect * 20),
          child: Container(
            height: 98,
            width: 98,
            decoration: BoxDecoration(
              color: AppColors.mainFFE09C,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: size, color: Colors.black),
          ),
        );
      },
    );
  }
}
