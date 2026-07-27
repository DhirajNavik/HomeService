import 'dart:math';
import 'package:flutter/material.dart';
import 'package:homeservice/core/extensions/context_extension.dart';
import 'package:homeservice/core/utils/app_palettes.dart';
import 'package:homeservice/core/utils/dimens.dart';

class CommonButton extends StatefulWidget {
  final Function()? onTap;
  final String? text;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? radius;
  final TextStyle? style;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;

  const CommonButton({
    this.onTap,
    this.text,
    this.padding,
    this.height,
    this.radius,
    this.style,
    this.color,
    this.textColor,
    this.borderColor,
    super.key,
  });

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton>
    with TickerProviderStateMixin {
  double _scale = 1.0;
  late AnimationController _gradientController;
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 50),
          lowerBound: 0.0,
          upperBound: 0.1,
        )..addListener(() {
          _scale = 1 - _controller.value;
        });

    _gradientController =
        AnimationController(vsync: this, duration: Duration(seconds: 6))
          ..forward()
          ..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _gradientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (details) {
        _controller.forward();
      },
      onPointerUp: (details) {
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: Listenable.merge([_gradientController, _controller]),
        builder: (context, _) {
          return Transform.scale(scale: _scale, child: buildButton());
        },
      ),
    );
  }

  Widget buildButton() {
    return InkWell(
      onTap: widget.onTap ?? () {},
      overlayColor: WidgetStatePropertyAll(AppPalettes.transparentColor),
      child: Container(
        height: (widget.height ?? Dimens.buttonHeight),
        margin: .zero,
        padding:
            widget.padding ??
            .symmetric(
              horizontal: Dimens.buttonPadding,
              vertical: Dimens.buttonPadding,
            ),

        decoration: BoxDecoration(
          color: widget.color,
          gradient: widget.color != null
              ? null
              : LinearGradient(
                  colors: [
                    AppPalettes.gradientFirstColor,
                    AppPalettes.gradientSecondColor,
                  ],
                  transform: GradientRotation(
                    _gradientController.value * 2 * pi,
                  ),
                ),
          borderRadius: .circular(widget.radius ?? Dimens.buttonRadius),
          border: Border.all(
            color:
                widget.borderColor ??
                AppPalettes.whiteColor.withOpacityExt(0.2),
            width: 1.4,
          ),
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            widget.text ?? "",
            style:
                widget.style ??
                context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color:widget.textColor?? AppPalettes.whiteColor,
                ),
          ),
        ),
      ),
    );
  }
}
