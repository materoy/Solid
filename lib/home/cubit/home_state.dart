part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState(this.backgroundColor);
  final int backgroundColor;

  @override
  List<Object?> get props => [backgroundColor];
}
