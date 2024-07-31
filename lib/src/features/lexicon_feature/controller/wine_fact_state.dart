part of 'wine_fact_cubit.dart';

@immutable
abstract class WineFactState {}

class WineFactInitial extends WineFactState {}

class WineFactLoading extends WineFactState {}

class WineFactLoaded extends WineFactState {
  final WineFact wineFact;

  WineFactLoaded(this.wineFact);
}

class WineFactError extends WineFactState {
  final String message;

  WineFactError(this.message);
}
