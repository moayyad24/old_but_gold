import 'package:flutter/material.dart';

class DotsIndicator extends StatefulWidget {
  final int dotsCount;
  final int currentDot;
  final Color activeColor;
  final Color inactiveColor;
  final double dotSize;
  final double activeDotWidth;

  const DotsIndicator({
    super.key,
    required this.dotsCount,
    required this.currentDot,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.dotSize = 8.0,
    this.activeDotWidth = 24.0,
  });

  @override
  State<DotsIndicator> createState() => _DotsIndicatorState();
}

class _DotsIndicatorState extends State<DotsIndicator>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    _controller.forward();
  }

  @override
  void didUpdateWidget(DotsIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentDot != widget.currentDot) {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.dotsCount, (index) {
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final isActive = index == widget.currentDot;
            final width =
                isActive
                    ? Tween<double>(
                      begin: widget.dotSize,
                      end: widget.activeDotWidth,
                    ).evaluate(_animation)
                    : widget.dotSize;

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: widget.dotSize,
              width: width,
              decoration: BoxDecoration(
                color: isActive ? widget.activeColor : widget.inactiveColor,
                borderRadius: BorderRadius.circular(widget.dotSize / 2),
              ),
            );
          },
        );
      }),
    );
  }
}
