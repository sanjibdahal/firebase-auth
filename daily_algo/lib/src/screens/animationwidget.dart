import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({super.key});

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> {
  bool _isAnimated = false;

  void _toggleAnimation() {
    setState(() {
      _isAnimated = !_isAnimated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            _toggleAnimation();
          },
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: _isAnimated ? 200 : 120,
                height: _isAnimated ? 200 : 120,
                color: _isAnimated ? Colors.blue : Colors.red,
                curve: Curves.easeInOut,
                child: Center(
                  child: Text(
                    _isAnimated ? 'Expanded' : 'Collapsed',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const AnimatedAlign(
                alignment: Alignment.bottomCenter,
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: Text('Animated Align'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
