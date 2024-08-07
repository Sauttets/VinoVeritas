import 'package:vinoveritas/src/features/home_favorite_feature/model/wine_model.dart';

abstract class WineState {
  final List<Wine> wines;
  final bool hasReachedMax;

  const WineState(this.wines, {this.hasReachedMax = false});
}

class WineInitial extends WineState {
  const WineInitial() : super(const []);
}

class WineLoading extends WineState {
  const WineLoading(super.wines);
}

class WineLoaded extends WineState {
  const WineLoaded(super.wines, {super.hasReachedMax});
}

class WineError extends WineState {
  final String message;
  const WineError(this.message, List<Wine> wines) : super(wines);
}
