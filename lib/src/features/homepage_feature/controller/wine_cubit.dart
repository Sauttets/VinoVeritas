import 'package:bloc/bloc.dart';
import 'package:vinoveritas/src/features/homepage_feature/controller/wine_state.dart';
import 'package:vinoveritas/src/features/homepage_feature/model/wine_model.dart';
import 'package:vinoveritas/src/features/homepage_feature/repository/wine_repository.dart';


class WineCubit extends Cubit<WineState> {
  final WineRepository wineRepository;
  final int userId = 1;  // Assuming user_id is always 1 as per your requirement
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

  Future<void> toggleFavorite(Wine wine) async {
    try {
      if (wine.isLiked) {
        await wineRepository.removeFromFavorites(userId, wine.id);
      } else {
        await wineRepository.addToFavorites(userId, wine.id);
      }

      final updatedWines = state.wines.map((w) {
        if (w.id == wine.id) {
          return Wine(
            id: w.id,
            name: w.name,
            year: w.year,
            country: w.country,
            type: w.type,
            description: w.description,
            imageURL: w.imageURL,
            volume: w.volume,
            volAlc: w.volAlc,
            isLiked: !w.isLiked,
            dryness: w.dryness,
            acidity: w.acidity,
            tanninLevel: w.tanninLevel,
            flavours: w.flavours,
            fitsTo: w.fitsTo,
            supermarkets: w.supermarkets,
          );
        } else {
          return w;
        }
      }).toList();

      emit(WineLoaded(updatedWines, hasReachedMax: state.hasReachedMax));
    } catch (e) {
      emit(WineError("Failed to update favorite status", state.wines));
    }
  }
}
