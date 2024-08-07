import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/import_favorites.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/set_username.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/share_favorites.dart';
import 'package:vinoveritas/src/features/settings_feature/controller/cubit/settings_cubit.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/static_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<SettingsCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: Spacings.widgetVertical,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(Spacings.widgetPaddingAll),
                      child: SetUsername(),
                    ),
                    BlocBuilder<SettingsCubit, SettingsState>(
                      builder: (context, state) {
                        if (state is ShowSettings) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal:  Spacings.widgetHorizontal),
                            child: DisplayAndCopyText(
                                text: state.settings.shareCode),
                          );
                        } else {
                          return const Padding(
                            padding: EdgeInsets.all(Spacings.widgetPaddingAll),
                            child: DisplayAndCopyText(
                                text: StaticText.noShareCode),
                          );
                        }
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.all(Spacings.widgetPaddingAll),
                      child: NewWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
