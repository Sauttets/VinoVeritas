import 'package:flutter/material.dart';
import 'package:vinoveritas/util/app_colors.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 78.0), // Ensures the navbar stretches and has a fixed height
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.black, width: 1),
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
        backgroundColor: AppColors.primaryWhite,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return Container(
      decoration: BoxDecoration(
        color: _selectedIndex == index ? AppColors.primaryRed : AppColors.transparent,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(8),
      child: Icon(
        icon,
        color: _selectedIndex == index ? AppColors.primaryWhite : Colors.black,
      ),
    );
  }
}
