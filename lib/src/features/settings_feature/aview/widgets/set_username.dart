import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/settings_feature/controller/cubit/settings_cubit.dart';
import 'package:vinoveritas/util/app_colors.dart';

class SetUsername extends StatelessWidget {
  const SetUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '  Nutzername:',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              width: 391.0,
              height: 44.0,
              child: TextField(
                onSubmitted: (value) {
                  context.read<SettingsCubit>().updateUsername(value);
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: AppColors.black),
                  ),
                  hintText: state is ShowSettings
                      ? state.getusername
                      : 'Nutzername eingeben',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
