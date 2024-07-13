import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/settings_feature/controller/cubit/settings_cubit.dart';
import 'package:vinoveritas/util/app_colors.dart';

class ImportFavorites extends StatelessWidget {
  const ImportFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                return const NewWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatefulWidget {
  const NewWidget({super.key});

  @override
  _NewWidgetState createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  final TextEditingController weincodeController = TextEditingController();
  final TextEditingController listNameController = TextEditingController();

  bool get isButtonEnabled =>
      weincodeController.text.isNotEmpty && listNameController.text.isNotEmpty;

  @override
  void dispose() {
    weincodeController.dispose();
    listNameController.dispose();
    super.dispose();
  }

  void _onImportPressed(BuildContext context) {
    // Import logic
    context.read<SettingsCubit>().importFavorites(
          listNameController.text,
          weincodeController.text,
        );

    // Clear the text fields
    weincodeController.clear();
    listNameController.clear();

    // Show feedback
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Favorites imported successfully!')),
    );

    // Update the button state
    setState(() {});
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
              '  Weincode:',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              width: 391.0,
              height: 44.0,
              child: TextField(
                controller: weincodeController,
                onChanged: (value) {
                  setState(() {});
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
            const SizedBox(height: 20),
            const Text(
              '  Name der Liste:',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              width: 391.0,
              height: 44.0,
              child: TextField(
                controller: listNameController,
                onChanged: (value) {
                  setState(() {});
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
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 0,
                  maxWidth: double.infinity,
                ),
                child: IntrinsicWidth(
                  child: SizedBox(
                    height: 30.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                            return isButtonEnabled
                                ? AppColors.primaryRed // Button is red when enabled
                                : AppColors.primaryGrey; // Button is grey when disabled
                          },
                        ),
                        shape: WidgetStateProperty.all<OutlinedBorder>(
                          const StadiumBorder(),
                        ),
                      ),
                      onPressed: isButtonEnabled
                          ? () => _onImportPressed(context)
                          : null, // Button is only clickable when enabled
                      child: const Text(
                        'Importieren',
                        style: TextStyle(
                          color: AppColors.primaryWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
