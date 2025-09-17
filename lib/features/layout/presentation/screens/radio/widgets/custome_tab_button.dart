import 'package:flutter/material.dart';

class CustomTabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor;
  final Color unselectedColor;

  const CustomTabButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    required this.selectedColor,
    required this.unselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: size.height * 0.05,
        width: size.width * 0.45,
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : unselectedColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Janna",
            ),
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
