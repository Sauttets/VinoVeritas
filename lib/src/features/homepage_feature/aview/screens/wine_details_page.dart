import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinoveritas/src/features/homepage_feature/controller/wine_cubit.dart';
import 'package:vinoveritas/src/features/homepage_feature/repository/wine_repository.dart';
import 'package:vinoveritas/src/features/homepage_feature/model/wine_model.dart';
import 'package:vinoveritas/src/features/homepage_feature/aview/widgets/description.dart';
import 'package:vinoveritas/src/features/homepage_feature/aview/widgets/taste_pallet.dart';
import 'package:vinoveritas/src/features/homepage_feature/aview/widgets/full_description.dart';
import 'package:vinoveritas/src/features/homepage_feature/aview/widgets/supermarket_selector.dart';
import 'package:vinoveritas/src/features/homepage_feature/aview/widgets/wine_deatail_top.dart';
import 'package:vinoveritas/src/services/persistence_service/isar_service.dart';
import 'package:vinoveritas/util/app_colors.dart';

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
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No share code available'));
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
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WineDetailTop(wine: widget.wine),
                      FullDescription(
                        tastePallet: TastePallet(
                          flavor1: widget.wine.flavours.isNotEmpty ? widget.wine.flavours[0] : '',
                          flavor2: widget.wine.flavours.length > 1 ? widget.wine.flavours[1] : null,
                          flavor3: widget.wine.flavours.length > 2 ? widget.wine.flavours[2] : null,
                          fit1: widget.wine.fitsTo.isNotEmpty ? widget.wine.fitsTo[0] : '',
                          fit2: widget.wine.fitsTo.length > 1 ? widget.wine.fitsTo[1] : null,
                          fit3: widget.wine.fitsTo.length > 2 ? widget.wine.fitsTo[2] : null,
                        ),
                        description: Description(description: widget.wine.description),
                      ),
                      const SizedBox(height: 16.0),
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
