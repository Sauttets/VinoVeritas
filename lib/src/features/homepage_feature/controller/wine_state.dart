import 'package:vinoveritas/src/features/homepage_feature/model/wine_model.dart';

abstract class WineState {}

class WineInitial extends WineState {}

class WineLoading extends WineState {}

class WineLoaded extends WineState {
  final List<Wine> wines;
  final bool hasReachedMax;
  final int? nextPageKey;

  WineLoaded({
    required this.wines,
    required this.hasReachedMax,
    this.nextPageKey,
  });

  WineLoaded copyWith({
    List<Wine>? wines,
    bool? hasReachedMax,
    int? nextPageKey,
  }) {
    return WineLoaded(
      wines: wines ?? this.wines,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      nextPageKey: nextPageKey ?? this.nextPageKey,
    );
  }
}

class WineError extends WineState {
  final String message;

  WineError(this.message);
}
