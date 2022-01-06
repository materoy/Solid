import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software/home/cubit/home_cubit.dart';
import 'package:solid_software/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var touchPosition = Offset.zero;
    return GestureDetector(
      onTapUp: (details) {
        touchPosition = details.globalPosition;
        context.read<HomeCubit>().generateRandomColor();
      },
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return _AnimatedColorChange(
                    backgroundColor: Color(state.backgroundColor),
                    location: touchPosition,
                  );
                },
              ),
            ),
            Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    context.l10n.displayText,
                    textStyle: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 400),
                  ),
                  ColorizeAnimatedText(
                    context.l10n.displayText,
                    textStyle: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w800),
                    colors: [Colors.black, Colors.green],
                  ),
                ],
                totalRepeatCount: 5,
                pause: const Duration(milliseconds: 2000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedColorChange extends StatefulWidget {
  const _AnimatedColorChange({
    Key? key,
    required this.backgroundColor,
    required this.location,
  }) : super(key: key);
  final Color backgroundColor;
  final Offset location;

  @override
  _AnimatedColorChangeState createState() => _AnimatedColorChangeState();
}

class _AnimatedColorChangeState extends State<_AnimatedColorChange>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment(widget.location.dx, widget.location.dy),
      children: [
        Transform.scale(
          scale: 1,
          child: AnimatedContainer(
            height: 1000,
            width: 1000,
            decoration: BoxDecoration(color: widget.backgroundColor),
            duration: const Duration(milliseconds: 600),
          ),
        ),
      ],
    );
  }
}
