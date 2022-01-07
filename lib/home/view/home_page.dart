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
    return GestureDetector(
      onTapUp: (details) {
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
                  return AnimatedColorChange(
                    backgroundColor: Color(state.backgroundColor),
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
                    speed: const Duration(milliseconds: 200),
                  ),
                  ColorizeAnimatedText(
                    context.l10n.displayText,
                    textStyle: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                    ),
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

class AnimatedColorChange extends StatefulWidget {
  const AnimatedColorChange({
    Key? key,
    required this.backgroundColor,
  }) : super(key: key);
  final Color backgroundColor;

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedColorChangeState createState() => _AnimatedColorChangeState();
}

class _AnimatedColorChangeState extends State<AnimatedColorChange>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.scale(
          scale: 1,
          child: AnimatedContainer(
            height: 1000,
            width: 1000,
            color: widget.backgroundColor,
            duration: const Duration(milliseconds: 600),
          ),
        ),
      ],
    );
  }
}
