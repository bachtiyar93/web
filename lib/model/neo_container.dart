import 'package:flutter/material.dart';

class NeoCon extends StatelessWidget {
  final Widget child;
  final double radius;
  final Offset blurOffset;
  final Color color;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;

  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;

  NeoCon({
    super.key,
    required this.child,
    this.radius = 1.0,
    this.color=Colors.white,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.alignment
  })  : blurOffset = Offset(radius / 2, radius / 2);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      alignment: alignment,
      duration: const Duration(milliseconds: 150),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
               color.mix(Colors.black12, .05),
               color,
               color,
              color.mix(Colors.white, .5),
            ],
            stops: const [
              0.0,
              .3,
              .6,
              1.0,
            ]),
        boxShadow: [
          BoxShadow(
            blurRadius: radius,
            offset: -blurOffset,
            color: color.mix(Colors.white, .6),
          ),
          BoxShadow(
            blurRadius: radius,
            offset: blurOffset,
            color: color.mix(Colors.black, .3),
          )
        ],
      ),
      child: child,
    );
  }
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount)!;
  }
}