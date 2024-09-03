import 'dart:math';
import 'package:flutter/material.dart';

class ColombianCoffeeWidget extends StatefulWidget {
  const ColombianCoffeeWidget({super.key});

  @override
  State<ColombianCoffeeWidget> createState() => _ColombianCoffeeWidgetState();
}

class _ColombianCoffeeWidgetState extends State<ColombianCoffeeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotationController;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    rotationController = Tween(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
        Future.delayed(const Duration(seconds: 10), () {
          controller.forward();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, body) => Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Perspectiva
              ..rotateY(rotationController.value),
            alignment: Alignment.center,
            /*angle: rotationController.value,*/
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/iglesia.webp"),
                ),
                border: Border.all(
                  width: 2,
                  color: const Color(0xFF3c6ba5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
