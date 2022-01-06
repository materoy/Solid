import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solid_software/home/cubit/home_cubit.dart';
import 'package:solid_software/home/home.dart';

import '../../helpers/pump_app.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

void main() {
  group('HomePage', () {
    testWidgets('renders HomeView', (tester) async {
      await tester.pumpApp(const HomePage());
      expect(find.byType(HomeView), findsOneWidget);
    });

    testWidgets('renders `Hey There`', (tester) async {
      await tester.pumpApp(const HomePage());
      expect(find.byType(Text), findsOneWidget);
    });
  });

  group('HomeView', () {
    late HomeCubit homeCubit;

    setUp(() {
      homeCubit = MockHomeCubit();
    });

    testWidgets('renders state color', (tester) async {
      const state = HomeState(0xFFFFFFFF);
      when(() => homeCubit.state).thenReturn(state);

      await tester.pumpApp(
        BlocProvider.value(
          value: homeCubit,
          child: const HomeView(),
        ),
      );

      expect(
        find.byWidget(
          AnimatedColorChange(
            backgroundColor: Color(state.backgroundColor),
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'calls generate_random_color when anywhere on the screen is tapped',
        (tester) async {
      when(() => homeCubit.state).thenReturn(const HomeState(0xFFFFFFFF));
      when(() => homeCubit.generateRandomColor()).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          value: homeCubit,
          child: const HomeView(),
        ),
      );
      await tester.tap(find.byType(Scaffold));
      verify(() => homeCubit.generateRandomColor()).called(1);
    });
  });
}
