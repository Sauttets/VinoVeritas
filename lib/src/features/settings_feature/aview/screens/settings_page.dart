import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/import_favorites.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/location_settings.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/set_username.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/design_selector.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/share_favorites.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/src/features/settings_feature/controller/bloc/settings_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the children vertically
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SetUsername(),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SetLocation(),
                  ),
                  BlocBuilder<SettingsBloc, SettingsState>(
                    builder: (context, state) {
                      return DesignSelector(
                        selectedIndex: state.selectedIndex,
                        onTabSelected: (index) {
                          context.read<SettingsBloc>().add(SelectIndex(index));
                          print(index);
                        },
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: DisplayAndCopyText(
                        text: '22218db8778892345732845uihfh9823823'),
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
    );
  }
}
