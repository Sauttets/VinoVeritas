import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/import_favorites.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/location_settings.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/set_username.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/design_selector.dart';
import 'package:vinoveritas/src/features/settings_feature/aview/widgets/share_favorites.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/src/features/settings_feature/controller/cubit/settings_cubit.dart';

// Import or define the missing widgets here
// import 'package:your_package/display_and_copy_text.dart';
// import 'package:your_package/new_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key); // Corrected here

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  int selectedIndex = 0;

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
                  DesignSelector(
                    selectedIndex: selectedIndex,
                    onTabSelected: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                      context.read<SettingsCubit>().setDesign(index);
                    },
                  ),
                  BlocBuilder<SettingsCubit, SettingsCubitState>(
                    builder: (context, state) {
                      if (state is Initial) {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: DisplayAndCopyText(
                            text:
                                'init', // replace `someField` with the actual field you want to display
                          ),
                        );
                      } else if (state is SettingUsername) {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: DisplayAndCopyText(
                            text: 'Another State Text',
                          ),
                        );
                      } else {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: DisplayAndCopyText(
                            text: 'design State',
                          ),
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
    );
  }
}
