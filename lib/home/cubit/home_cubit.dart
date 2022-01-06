import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(0xFFFFFFFF));
  final rand = Random();

  void generateRandomColor() {
    final stringBuffer = StringBuffer('0xFF');

    for (var i = 0; i < 6; i++) {
      final value = rand.nextInt(255).toRadixString(16);
      stringBuffer.write(value);
    }

    final color = int.parse(stringBuffer.toString());
    print(color);
    emit(HomeState(color));
  }
}
