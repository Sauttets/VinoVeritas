import 'package:bloc/bloc.dart';
import 'package:vinoveritas/src/features/settings_feature/model/settings_model.dart';

part 'settings_cubit_state.dart';

class SettingsCubit extends Cubit<SettingsCubitState> {
  SettingsModel settings = const SettingsModel();

  SettingsCubit() : super(Initial());

  void setUsername(String username) {
    settings = settings.copyWith(username: username);
    print('Username set to: $username');
    emit(SettingUsername(username));
  }

  void setDesign(int designIndex) {
    settings = settings.copyWith(designIndex: designIndex);
    print('Design set to: $designIndex');
    emit(SettingDesign(designIndex));
  }
}
