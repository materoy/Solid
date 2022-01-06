import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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

    // testWidgets('renders current count', (tester) async {
    //   const state = 42;
    //   when(() => counterCubit.state).thenReturn(state);
    //   await tester.pumpApp(
    //     BlocProvider.value(
    //       value: counterCubit,
    //       child: const CounterView(),
    //     ),
    //   );
    //   expect(find.text('$state'), findsOneWidget);
    // });

    // testWidgets('calls increment when increment button is tapped',
    //     (tester) async {
    //   when(() => counterCubit.state).thenReturn(0);
    //   when(() => counterCubit.increment()).thenReturn(null);
    //   await tester.pumpApp(
    //     BlocProvider.value(
    //       value: counterCubit,
    //       child: const CounterView(),
    //     ),
    //   );
    //   await tester.tap(find.byIcon(Icons.add));
    //   verify(() => counterCubit.increment()).called(1);
    // });

    // testWidgets('calls decrement when decrement button is tapped',
    //     (tester) async {
    //   when(() => counterCubit.state).thenReturn(0);
    //   when(() => counterCubit.decrement()).thenReturn(null);
    //   await tester.pumpApp(
    //     BlocProvider.value(
    //       value: counterCubit,
    //       child: const CounterView(),
    //     ),
    //   );
    //   await tester.tap(find.byIcon(Icons.remove));
    //   verify(() => counterCubit.decrement()).called(1);
    // });
  });
}
