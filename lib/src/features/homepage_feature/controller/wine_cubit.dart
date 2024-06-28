import 'package:bloc/bloc.dart';
import 'package:vinoveritas/src/features/homepage_feature/controller/wine_state.dart';
import 'package:vinoveritas/src/features/homepage_feature/repository/wine_repository.dart';

class WineCubit extends Cubit<WineState> {
  final WineRepository wineRepository;
  int currentStartRange = 1;
  final int rangeIncrement = 20;

  WineCubit({required this.wineRepository}) : super(WineInitial());

  Future<void> fetchWines() async {
    if (state is WineLoading) return;

    try {
      emit(WineLoading(state.wines));
      final newWines = await wineRepository.fetchWines(currentStartRange, currentStartRange + rangeIncrement - 1);
      if (newWines.isEmpty) {
        emit(WineLoaded(state.wines, hasReachedMax: true));
      } else {
        currentStartRange += rangeIncrement;
        emit(WineLoaded(List.from(state.wines)..addAll(newWines)));
      }
    } catch (e) {
      emit(WineError("Failed to fetch wines", state.wines));
    }
  }
}
