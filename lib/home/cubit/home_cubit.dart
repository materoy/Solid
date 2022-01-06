import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(0xFFFFFFFF));
  final rand = Random();

  /* Generates a set of 6 random hexadecimal values
    with 1677216 different possibilites 
    16 ^ 6 = 1677216 
    */
  void generateRandomColor() {
    final stringBuffer = StringBuffer('0xFF');

    for (var i = 0; i < 6; i++) {
      final value = rand.nextInt(256);
      final hexValue = value.toRadixString(16);
      stringBuffer.write(hexValue);
    }

    final color = int.parse(stringBuffer.toString());
    emit(HomeState(color));
  }
}
