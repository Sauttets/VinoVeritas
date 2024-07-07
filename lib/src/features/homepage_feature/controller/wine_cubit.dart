import 'package:bloc/bloc.dart';
import 'package:vinoveritas/src/features/homepage_feature/controller/wine_state.dart';
import 'package:vinoveritas/src/features/homepage_feature/model/wine_model.dart';
import 'package:vinoveritas/src/features/homepage_feature/repository/wine_repository.dart';

class WineCubit extends Cubit<WineState> {
  final WineRepository wineRepository;
  int offset = 1;
  final int limit = 20;

  String color = 'all';
  String sort = 'most-liked';
  String? fit;
  String? flavour;
  bool favlist;
  String shareCode = '46f5d57f';

  WineCubit({required this.wineRepository, this.favlist = false}) : super(const WineInitial());

  Future<void> fetchWines({bool resetList = false}) async {
    if (state is WineLoading) return;

    if (resetList) {
      offset = 1;
      emit(const WineInitial());
    }

    try {
      emit(WineLoading(state.wines));
      final newWines = await wineRepository.fetchWines(
        offset: offset,
        limit: limit,
        color: color,
        sort: sort,
        fit: fit,
        flavour: flavour,
        favlist: favlist,
        shareCode: shareCode,
      );
      if (newWines.isEmpty) {
        emit(WineLoaded(state.wines, hasReachedMax: true));
      } else {
        offset += limit;
        emit(WineLoaded(List.from(state.wines)..addAll(newWines)));
      }
    } catch (e) {
      emit(WineError("Failed to fetch wines", state.wines));
    }
  }

  Future<void> applyFilters({
    String? color,
    String? sort,
    String? fit,
    String? flavour,
  }) async {
    if (color != null) this.color = color;
    if (sort != null) this.sort = sort;
    if (fit != null) this.fit = fit;
    if (flavour != null) this.flavour = flavour;

    await fetchWines(resetList: true);
  }

  Future<void> fetchFavlistWines(String favlistShareCode) async {
    favlist = true;
    shareCode = favlistShareCode;
    await fetchWines(resetList: true);
  }

  Future<void> toggleFavorite(Wine wine) async {
    try {
      if (wine.isLiked) {
        await wineRepository.removeFromFavorites(shareCode, wine.id);
      } else {
        await wineRepository.addToFavorites(shareCode, wine.id);
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
