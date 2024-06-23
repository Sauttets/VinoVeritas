import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/settings_feature/controller/cubit/settings_cubit.dart';
import 'package:vinoveritas/util/app_colors.dart';

class SetUsername extends StatelessWidget {
  const SetUsername({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              // Trigger the state change here
              context.read<SettingsCubit>().loadSettings();
              print('inthere.............................');
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.primaryWhite,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
