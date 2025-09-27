import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedOverlayCards extends StatefulWidget {
  final List<OverlayCardData> cards;
  final Duration animationDuration;
  final bool autoAnimate;

  const AnimatedOverlayCards({
    super.key,
    required this.cards,
    this.animationDuration = const Duration(milliseconds: 800),
    this.autoAnimate = true,
  });

  @override
  State<AnimatedOverlayCards> createState() => _AnimatedOverlayCardsState();
}

class _AnimatedOverlayCardsState extends State<AnimatedOverlayCards> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _scaleAnimations;
  late List<Animation<double>> _rotationAnimations;
  late List<Animation<Offset>> _offsetAnimations;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();

    if (widget.autoAnimate) {
      _startAnimations();
    }
  }

  void _initializeAnimations() {
    _controllers = List.generate(
      widget.cards.length,
      (index) => AnimationController(
        duration: widget.animationDuration,
        vsync: this,
      ),
    );

    _scaleAnimations = _controllers.map((controller) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.elasticOut),
      );
    }).toList();

    _rotationAnimations = _controllers.map((controller) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      );
    }).toList();

    _offsetAnimations = _controllers.map((controller) {
      return Tween<Offset>(
        begin: const Offset(0.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOut),
      );
    }).toList();
  }

  void _startAnimations() {
    for (int i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () {
        if (mounted) {
          _controllers[i].forward();
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Stack(
        children: widget.cards.asMap().entries.map((entry) {
          final index = entry.key;
          final cardData = entry.value;

          return AnimatedBuilder(
            animation: _controllers[index],
            builder: (context, child) {
              return Transform.translate(
                offset: cardData.offset,
                child: Transform.rotate(
                  angle: cardData.rotation * (3.14159 / 180) * _rotationAnimations[index].value,
                  child: Transform.scale(
                    scale: _scaleAnimations[index].value,
                    child: _buildCard(cardData),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCard(OverlayCardData cardData) {
    return Container(
      padding: cardData.padding,
      decoration: BoxDecoration(
        color: cardData.backgroundColor,
        borderRadius: BorderRadius.circular(cardData.borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 30,
            offset: const Offset(0, 15),
            spreadRadius: 0,
          ),
        ],
      ),
      child: cardData.hasBlur
          ? ClipRRect(
              borderRadius: BorderRadius.circular(cardData.borderRadius),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: cardData.blurValue, sigmaY: cardData.blurValue),
                child: Container(
                  color: cardData.backgroundColor.withOpacity(0.3),
                  child: cardData.child,
                ),
              ),
            )
          : cardData.child,
    );
  }
}

class OverlayCardData {
  final Widget child;
  final Offset offset;
  final double rotation;
  final Color backgroundColor;
  final double borderRadius;
  final EdgeInsets padding;
  final bool hasBlur;
  final double blurValue;

  const OverlayCardData({
    required this.child,
    this.offset = Offset.zero,
    this.rotation = 0.0,
    this.backgroundColor = Colors.white,
    this.borderRadius = 16.0,
    this.padding = const EdgeInsets.all(16.0),
    this.hasBlur = false,
    this.blurValue = 7.6,
  });
}
