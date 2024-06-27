// wine_fact_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:vinoveritas/src/features/facts_feature/model/wine_fact_model.dart';
import 'dart:convert';

part 'wine_fact_state.dart';

class WineFactCubit extends Cubit<WineFactState> {
  WineFactCubit() : super(WineFactInitial());

  Future<void> fetchWineFact() async {
    emit(WineFactLoading());
    try {
      final response = await http.get(Uri.parse('https://api.gargelkarg.com/getWineFactOTD'));
      if (response.statusCode == 200) {
        final wineFact = WineFact.fromJson(json.decode(response.body));
        emit(WineFactLoaded(wineFact));
      } else {
        emit(WineFactError("Failed to fetch wine fact"));
      }
    } catch (e) {
      emit(WineFactError("Failed to fetch wine fact"));
    }
  }
}
