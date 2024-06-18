import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vinoveritas/src/features/settings_feature/model/settings_model.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsModel settings_model;

  SettingsBloc(this.settings_model)
      : super(SettingsState.initial(settings_model,
            0)); // 0 is just an example, replace it with the correct value
  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is SelectIndex) {
      settings_model = settings_model.copyWith(
          designIndex:
              event.index); // update your model with the selected index
      print('Selected index: ${settings_model.designIndex}');
    }
  }
}
