import 'package:flutter/material.dart';

class RotatedOverlayCard extends StatelessWidget {
  final Widget child;
  final double rotation;
  final double offsetX;
  final double offsetY;
  final Color? backgroundColor;
  final double borderRadius;
  final EdgeInsets padding;

  const RotatedOverlayCard({
    super.key,
    required this.child,
    this.rotation = 0.0,
    this.offsetX = 0.0,
    this.offsetY = 0.0,
    this.backgroundColor,
    this.borderRadius = 16.0,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(offsetX, offsetY),
      child: Transform.rotate(
        angle: rotation * (3.14159 / 180), // Convert degrees to radians
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

class StackedOverlayCards extends StatelessWidget {
  final List<RotatedOverlayCard> cards;
  final double stackHeight;
  final double stackWidth;

  const StackedOverlayCards({
    super.key,
    required this.cards,
    this.stackHeight = 300,
    this.stackWidth = 300,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: stackHeight,
      width: stackWidth,
      child: Stack(
        children: cards.map((card) => card).toList(),
      ),
    );
  }
}

// Example usage widget
class ExampleRotatedCards extends StatelessWidget {
  const ExampleRotatedCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: StackedOverlayCards(
          stackHeight: 400,
          stackWidth: 350,
          cards: [
            // Bottom card (dark grey)
            RotatedOverlayCard(
              rotation: -5.0,
              offsetX: 10,
              offsetY: 20,
              backgroundColor: Colors.grey[800],
              borderRadius: 20,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      _buildIconBox(Icons.inventory_2, "20"),
                      const SizedBox(width: 16),
                      _buildIconBox(Icons.show_chart, "35%"),
                      const SizedBox(width: 16),
                      _buildIconBox(Icons.mail, "400"),
                    ],
                  ),
                ],
              ),
            ),

            // Top card (light beige)
            RotatedOverlayCard(
              rotation: 3.0,
              offsetX: -5,
              offsetY: -10,
              backgroundColor: Colors.grey[200],
              borderRadius: 16,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'посылка',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'AF302B',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _buildSmallIcon(Icons.local_shipping, Colors.grey[700]!),
                          const SizedBox(width: 8),
                          _buildSmallIcon(Icons.location_on, Colors.black),
                          const SizedBox(width: 8),
                          _buildSmallIcon(Icons.refresh, Colors.white, backgroundColor: Colors.black),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconBox(IconData icon, String text) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallIcon(IconData icon, Color iconColor, {Color? backgroundColor}) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 16,
      ),
    );
  }
}
