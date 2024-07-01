import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';

// Widget für das Bild
class SupermarketImg extends StatelessWidget {
  final String name;

  const SupermarketImg({super.key, required this.name});

  String _getImagePath(String name) {
    if (name.toLowerCase().contains('edeka')) {
      return 'assets/images/Edeka.png';
    } else if (name.toLowerCase().contains('netto')) {
      return 'assets/images/Netto.png';
    } else if (name.toLowerCase().contains('rewe')) {
      return 'assets/images/Rewe.png';
    } else if (name.toLowerCase().contains('kaufland')) {
      return 'assets/images/Kaufland.png';
    } else if (name.toLowerCase().contains('aldi')) {
      return 'assets/images/Aldi.png';
    } else if (name.toLowerCase().contains('lidl')) {
      return 'assets/images/Lidl.png';
    } else if (name.toLowerCase().contains('penny')) {
      return 'assets/images/Penny.png';
    } else {
      return 'assets/images/Generic_Supermarket.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Spacings.cornerRadius),
      ),
      clipBehavior: Clip
          .antiAlias, // Ensures the child is clipped within the border radius
      child: Image.asset(
        _getImagePath(name),
        width: Spacings.supermarketLogo,
        height: Spacings.supermarketLogo,
        fit: BoxFit.cover,
      ),
    );
  }
}

class SupermarketText extends StatelessWidget {
  final String name;
  final String address;
  final String postalCode;
  final String price;

  const SupermarketText({
    super.key,
    required this.name,
    required this.address,
    required this.postalCode,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
            fontSize: Spacings.titleFontSize,
          ),
        ),
        Text(
          '$address · $postalCode',
          style: const TextStyle(
            color: AppColors.primaryText,
            fontSize: Spacings.textFontSize,
          ),
        ),
        const SizedBox(height: Spacings.vertical),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Preis: $price',
              style: const TextStyle(
                color: AppColors.primaryText,
                fontSize: Spacings.textFontSize,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Widget für die Supermarket-Informationen
class SupermarketSelector extends StatelessWidget {
  final String name;
  final String address;
  final String postalCode;
  final String price;

  const SupermarketSelector({
    super.key,
    required this.name,
    required this.address,
    required this.postalCode,
    required this.price,
  });

  Future<void> openGoogleMaps(String address) async {
    String query = Uri.encodeComponent(address);
    String googleMapsUrl =
        "https://www.google.com/maps/search/?api=1&query=$query";
    Uri url = Uri.parse(googleMapsUrl);

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    String mapsAddress = 'Edeka Baur, Reichenaustraße 36, 78467 Konstanz';
    //String mapsAddress = '$name, $address, $postalCode';
    return Card(
      elevation: 0.0,
      color: AppColors.primaryWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Spacings.cornerRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacings.horizontal,
          vertical: Spacings.vertical,
        ),
        child: Row(
          children: [
            SupermarketImg(name: name),
            const SizedBox(width: Spacings.horizontal),
            Expanded(
              child: SupermarketText(
                name: name,
                address: address,
                postalCode: postalCode,
                price: price,
              ),
            ),
            const SizedBox(width: 40),
            GestureDetector(
              onTap: () => openGoogleMaps(mapsAddress),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primaryGrey,
                size: Spacings.iconSizeXS,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
