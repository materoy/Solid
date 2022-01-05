import 'dart:math';

import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(0xFFFFFFFF));
  final rand = Random();

  void generateRandomColor() {
    final stringBuffer = StringBuffer('0xFF');

    for (var i = 0; i < 6; i++) {
      final value = rand.nextInt(255).toRadixString(16);
      stringBuffer.write(value);
    }

    print(stringBuffer.toString());
    // emit(HomeState(stringBuffer.toString()));
  }
}
