import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/controller/home_and_favorite/wine_cubit.dart';
import 'package:vinoveritas/src/repository/wine_repository.dart';
import 'package:vinoveritas/src/model/home_and_favorite/wine_model.dart';
import 'package:vinoveritas/src/aview/wine_detail/widgets/wine_description.dart';
import 'package:vinoveritas/src/aview/wine_detail/widgets/taste_pallet.dart';
import 'package:vinoveritas/src/aview/wine_detail/widgets/full_wine_description.dart';
import 'package:vinoveritas/src/aview/wine_detail/widgets/supermarket_selector.dart';
import 'package:vinoveritas/src/aview/wine_detail/widgets/wine_deatail_header.dart';
import 'package:vinoveritas/src/services/persistence_service/isar_service.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';
import 'package:vinoveritas/util/static_text.dart';

class WineDetailsPage extends StatefulWidget {
  final Wine wine;
  final bool favlist;

  const WineDetailsPage({
    super.key,
    required this.wine,
    required this.favlist,
  });

  @override
  WineDetailsPageState createState() => WineDetailsPageState();
}

class WineDetailsPageState extends State<WineDetailsPage> {
  late Future<String> _shareCodeFuture;

  @override
  void initState() {
    super.initState();
    _shareCodeFuture = _getShareCode();
  }

  Future<String> _getShareCode() async {
    final lists = await IsarService().getSharedLists();
    return lists.isNotEmpty ? lists.first.shareCode : '';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _shareCodeFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryRed),
          ));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text(StaticText.noShareCode));
        } else {
          final shareCode = snapshot.data!;
          return BlocProvider(
            create: (context) => WineCubit(
              wineRepository: WineRepository(),
              favlist: widget.favlist,
              shareCode: shareCode,
            ),
            child: Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: AppBar(
                backgroundColor: AppColors.backgroundColor,
                iconTheme: const IconThemeData(color: AppColors.primaryText),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WineDetailsHeader(wine: widget.wine),
                      FullWineDescription(
                        tastePallet: TastePallet(
                          flavor1: widget.wine.flavours.isNotEmpty ? widget.wine.flavours[0] : '',
                          flavor2: widget.wine.flavours.length > 1 ? widget.wine.flavours[1] : null,
                          flavor3: widget.wine.flavours.length > 2 ? widget.wine.flavours[2] : null,
                          fit1: widget.wine.fitsTo.isNotEmpty ? widget.wine.fitsTo[0] : '',
                          fit2: widget.wine.fitsTo.length > 1 ? widget.wine.fitsTo[1] : null,
                          fit3: widget.wine.fitsTo.length > 2 ? widget.wine.fitsTo[2] : null,
                        ),
                        description: WineDescription(description: widget.wine.description),
                      ),
                      const SizedBox(height: Spacings.widgetVertical),
                      if (widget.wine.supermarkets.isNotEmpty)
                        ...widget.wine.supermarkets.map((supermarket) => SupermarketSelector(
                              name: supermarket.name,
                              address: '${supermarket.street} ${supermarket.houseNumber}, ${supermarket.city}',
                              postalCode: supermarket.postalCode,
                              price: '${supermarket.price.toStringAsFixed(2)}€',
                            )),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
