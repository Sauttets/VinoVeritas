import 'package:bloc/bloc.dart';
import 'package:vinoveritas/src/features/homepage_feature/controller/wine_state.dart';
import 'package:vinoveritas/src/features/homepage_feature/repository/wine_repository.dart';


class WineCubit extends Cubit<WineState> {
  final WineRepository wineRepository;
  int currentPage = 1;
  final int pageSize = 20;

  WineCubit({required this.wineRepository}) : super(WineInitial());

  Future<void> fetchWines() async {
    emit(WineLoading());
    try {
      final wines = await wineRepository.fetchWines(start: (currentPage - 1) * pageSize + 1, end: currentPage * pageSize);
      emit(WineLoaded(wines: wines, hasReachedMax: wines.length < pageSize));
    } catch (e) {
      print('Error fetching wines: $e');
      emit(WineError("Failed to fetch wines: $e"));
    }
  }

  Future<void> fetchMoreWines() async {
    if (state is WineLoaded && !(state as WineLoaded).hasReachedMax) {
      currentPage++;
      try {
        final additionalWines = await wineRepository.fetchWines(start: (currentPage - 1) * pageSize + 1, end: currentPage * pageSize);
        final currentState = state as WineLoaded;
        emit(WineLoaded(
          wines: List.of(currentState.wines)..addAll(additionalWines),
          hasReachedMax: additionalWines.length < pageSize,
        ));
      } catch (e) {
        print('Error fetching more wines: $e');
        emit(WineError("Failed to fetch more wines: $e"));
      }
    }
  }
}
