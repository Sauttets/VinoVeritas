import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/settings_feature/controller/cubit/settings_cubit.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';

class ImportFavorites extends StatelessWidget {
  const ImportFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                return const NewWidget();
              },
            ),
          ],
        ),

    );
  }
}

class NewWidget extends StatefulWidget {
  const NewWidget({super.key});

  @override
  NewWidgetState createState() => NewWidgetState();
}

class NewWidgetState extends State<NewWidget> {
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
    context.read<SettingsCubit>().importFavorites(
          listNameController.text,
          weincodeController.text,
        );
    weincodeController.clear();
    listNameController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Favorites imported successfully!')),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Spacings.cornerRadius),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(Spacings.widgetPaddingAll),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '  Weincode:',
              style: TextStyle(
                fontSize: Spacings.textFontSize,
              ),
            ),
            SizedBox(
              height: Spacings.textFieldHeight,
              child: TextField(
                controller: weincodeController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Spacings.cornerRadius),
                    borderSide: const BorderSide(color: AppColors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: Spacings.widgetVertical),
            const Text(
              '  Name der Liste:',
              style: TextStyle(
                fontSize: Spacings.textFontSize,
              ),
            ),
            SizedBox(
              height: Spacings.textFieldHeight,
              child: TextField(
                controller: listNameController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Spacings.cornerRadius),
                    borderSide: const BorderSide(color: AppColors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: Spacings.widgetVertical),
            Align(
              alignment: Alignment.centerRight,
                child: IntrinsicWidth(
                  child: SizedBox(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                            return isButtonEnabled
                                ? AppColors.primaryRed
                                : AppColors.primaryGrey;
                          },
                        ),
                        shape: WidgetStateProperty.all<OutlinedBorder>(
                          const StadiumBorder(),
                        ),
                      ),
                      onPressed: isButtonEnabled
                          ? () => _onImportPressed(context)
                          : null,
                      child: const Text(
                        'Importieren',
                        style: TextStyle(
                          color: AppColors.white,
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
