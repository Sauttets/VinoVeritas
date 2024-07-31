import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vinoveritas/src/services/router_service/app_router.dart';
import 'package:vinoveritas/util/app_colors.dart';
import 'package:vinoveritas/util/spacings.dart';

class CustomNavBar extends StatefulWidget {
  final GoRouter goRouter;

  const CustomNavBar({super.key, required this.goRouter});

  @override
  CustomNavBarState createState() => CustomNavBarState();
}

class CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateSelectedIndex();
  }

  void _updateSelectedIndex() {
    final currentLocation = GoRouter.of(context).location;
    int newIndex = 0;
    if (currentLocation.startsWith('/home')) {
      newIndex = 0;
    } else if (currentLocation.startsWith('/Lexicon')) {
      newIndex = 1;
    } else if (currentLocation.startsWith('/Favorites')) {
      newIndex = 2;
    } else if (currentLocation.startsWith('/Settings')) {
      newIndex = 3;
    }
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        widget.goRouter.push('/home');
        break;
      case 1:
        widget.goRouter.push('/Lexicon');
        break;
      case 2:
        widget.goRouter.push('/Favorites');
        break;
      case 3:
        widget.goRouter.push('/Settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return bottomInset == 0 ? Container(
      constraints: const BoxConstraints.expand(height: 78.0),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.black),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.wine_bar, 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.book, 1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.favorite_border, 2),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.person_outline, 3),
            label: '',
          ),
        ],
        backgroundColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
      ),
    ) : const SizedBox.shrink();
  }

  Widget _buildIcon(IconData icon, int index) {
    return Container(
      decoration: BoxDecoration(
        color: _selectedIndex == index
            ? AppColors.primaryRed
            : AppColors.transparent,
        borderRadius: BorderRadius.circular(Spacings.cardBorderRadius),
      ),
      padding: const EdgeInsets.all(8),
      child: Icon(
        icon,
        color: _selectedIndex == index ? AppColors.contrastOnRed : AppColors.black,
      ),
    );
  }
}
