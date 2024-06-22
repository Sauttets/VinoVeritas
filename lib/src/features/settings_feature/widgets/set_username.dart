import 'package:flutter/material.dart';
import 'package:vinoveritas/src/isar/IsarService.dart';
import 'package:vinoveritas/src/isar/IsarServiceInterface.dart';
import 'package:vinoveritas/util/app_colors.dart';

class SetUsername extends StatelessWidget {
  final IsarServiceInterface _isarService = IsarService();
  void _updateUser(int id, String? name, int? plz, double? radius, int? colorMode) {
    _isarService.updateUser(id, name, plz, radius, colorMode);
  }
  SetUsername({super.key});

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
