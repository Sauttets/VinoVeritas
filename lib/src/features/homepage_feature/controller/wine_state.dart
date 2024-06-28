import 'package:vinoveritas/src/features/homepage_feature/model/wine_model.dart';

abstract class WineState {
  final List<Wine> wines;
  final bool hasReachedMax;

  const WineState(this.wines, {this.hasReachedMax = false});
}

class WineInitial extends WineState {
  const WineInitial() : super(const []);
}

class WineLoading extends WineState {
  const WineLoading(List<Wine> wines) : super(wines);
}

class WineLoaded extends WineState {
  const WineLoaded(List<Wine> wines, {bool hasReachedMax = false}) : super(wines, hasReachedMax: hasReachedMax);
}

class WineError extends WineState {
  final String message;
  const WineError(this.message, List<Wine> wines) : super(wines);
}
