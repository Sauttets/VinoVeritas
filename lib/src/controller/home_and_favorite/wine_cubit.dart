import 'package:bloc/bloc.dart';
import 'package:vinoveritas/src/controller/home_and_favorite/wine_state.dart';
import 'package:vinoveritas/src/model/home_and_favorite/wine_model.dart';
import 'package:vinoveritas/src/repository/wine_repository.dart';
import 'package:vinoveritas/util/static_text.dart';

class WineCubit extends Cubit<WineState> {
  final WineRepository wineRepository;
  int offset = 1;
  final int limit = 20;

  String color = 'all';
  String sort = 'most-liked';
  String? fitOrFlavour;
  String? searchQuery;
  bool favlist;
  String shareCode;

  WineCubit({required this.wineRepository, required this.favlist, required this.shareCode}) : super(const WineInitial());

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
        fitOrFlavour: fitOrFlavour,
        searchQuery: searchQuery,
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
      emit(WineError(StaticText.noWineFound, state.wines));
    }
  }

  Future<void> applyFilters({
    String? color,
    String? sort,
    String? fitOrFlavour,
    String? searchQuery,
  }) async {
    if (color != null) this.color = color;
    if (sort != null) this.sort = sort;
    if (fitOrFlavour != null) this.fitOrFlavour = fitOrFlavour;
    if (searchQuery != null) this.searchQuery = searchQuery;

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
      emit(WineError(StaticText.updateFavoritesFailed, state.wines));
    }
  }
}
