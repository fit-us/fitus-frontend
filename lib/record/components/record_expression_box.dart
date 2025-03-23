import 'package:flutter/material.dart';

class ExpressionBox extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isSelected;

  const ExpressionBox({
    super.key,
    required this.label,
    this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(9999),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(9999),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
            width: 1.0,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
