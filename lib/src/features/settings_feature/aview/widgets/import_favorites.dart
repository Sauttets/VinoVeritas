import 'package:flutter/material.dart';
import 'package:vinoveritas/util/app_colors.dart';

class ImportFavorites extends StatelessWidget {
  const ImportFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Your existing widgets here...
            NewWidget(),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({super.key});

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
              '  Name der Liste:',
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
                    borderSide: const BorderSide(color: AppColors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Add more space
            Align(
              alignment: Alignment.centerRight,
              child: FractionallySizedBox(
                widthFactor: 1 / 3,
                child: SizedBox(
                  height: 30.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(AppColors.primaryGrey),
                      shape: WidgetStateProperty.all<OutlinedBorder>(
                        const StadiumBorder(),
                      ),
                    ),
                    onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
