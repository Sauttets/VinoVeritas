import 'package:flutter/material.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/src/services/persistence_service/IsarServiceInterface.dart';

class SetLocation extends StatefulWidget {
  final IsarServiceInterface isarService;

  const SetLocation({super.key, required this.isarService});

  @override
  SetLocationState createState() => SetLocationState();
}

class SetLocationState extends State<SetLocation> {
  double _currentSliderValue = 0;

  void _updateUser(
      int id, String? name, int? plz, double? radius, int? colorMode) {
    widget.isarService.updateSettings(id, name, plz, radius, colorMode);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.primaryWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '  Ort oder PLZ:',
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
            const SizedBox(height: 20), // Add more space
            const Text(
              '  Radius:',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: 100,
              divisions: 100,
              label: '${_currentSliderValue.round()} km',
              activeColor: AppColors.primaryGrey,
              inactiveColor: AppColors.secondaryGrey,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                  _updateUser(1, null, null, value, null);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
