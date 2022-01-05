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
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.read<HomeCubit>().generateRandomColor(),
          child: Scaffold(
              backgroundColor: Color(state.backgroundColor),
              body: Center(child: Text(context.l10n.displayText))),
        );
      },
    );
  }
}
