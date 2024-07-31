// wine_fact_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vinoveritas/src/features/lexicon_feature/model/wine_fact_model.dart';
import 'package:vinoveritas/src/features/lexicon_feature/wine_fact_repository.dart';
part 'wine_fact_state.dart';

class WineFactCubit extends Cubit<WineFactState> {
  final WineFactRepository wineFactRepository;

  WineFactCubit({required this.wineFactRepository}) : super(WineFactInitial());

  Future<void> fetchWineFact() async {
    emit(WineFactLoading());
    try {
      final wineFact = await wineFactRepository.fetchWineFact();
      emit(WineFactLoaded(wineFact));
    } catch (e) {
      const defaultFact = 'The color of a wine is determined by the grape variety and the winemaking process.';
      emit(WineFactLoaded(WineFact(fact: defaultFact)));
    }
  }
}
