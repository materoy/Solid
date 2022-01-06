import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solid_software/home/cubit/home_cubit.dart';

void main() {
  group('HomeCubit', () {
    test('initial color is white', () {
      expect(HomeCubit().state, const HomeState(0xFFFFFFFF));
    });

    blocTest<HomeCubit, HomeState>(
      'generates a new color',
      build: () => HomeCubit(),
      act: (cubit) => cubit.generateRandomColor(),
      expect: () => [isInstanceOf<HomeState>()],
    );

    blocTest<HomeCubit, HomeState>(
      'returns a valid color value on generate new color',
      build: () => HomeCubit(),
      act: (cubit) => cubit.generateRandomColor(),
      verify: (cubit) =>
          cubit.state.backgroundColor > 0 &&
          cubit.state.backgroundColor < 16777216,
    );
  });
}
