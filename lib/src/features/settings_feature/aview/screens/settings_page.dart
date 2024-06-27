import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/design_selector.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/import_favorites.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/set_username.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/share_favorites.dart';
import 'package:vinoveritas/src/features/settings_feature/controller/cubit/settings_cubit.dart';
import 'package:vinoveritas/util/app_colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 16.0, // Add padding above the content
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Center(
                // Wrap the Column with a Center widget
                child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Center the children vertically
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SetUsername(),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    BlocBuilder<SettingsCubit, SettingsState>(
                      builder: (context, state) {
                        int currentIndex = 0; // Default value
                        if (state is SettingsInit) {
                          currentIndex = state.getselectedIndex;
                        } else if (state is ShowSettings) {
                          currentIndex = state.getselectedIndex;
                        }
                        return DesignSelector(
                          selectedIndex: currentIndex,
                          onTabSelected: (index) {
                            context.read<SettingsCubit>().updateSelectedIndex(
                                index); // This method should update the state with the new index
                            context.read<SettingsCubit>().loadSettings();
                          },
                        );
                      },
                    ),
                    BlocBuilder<SettingsCubit, SettingsState>(
                      builder: (context, state) {
                        if (state is ShowSettings) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DisplayAndCopyText(
                                text: '${state.specificVariable} ${state.getselectedIndex}'),
                          );
                        } else if (state is SettingsInit) {
                          // Handle other states or show a placeholder
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DisplayAndCopyText(
                                text: 'initstate: ${state.getselectedIndex}'),
                          );
                        } else {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: DisplayAndCopyText(text: 'otherstate'),
                          );
                        }
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
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
