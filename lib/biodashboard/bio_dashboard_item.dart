import 'package:flutter/material.dart';

class BioDashboardItem extends StatelessWidget {
  final String icon;
  final Size iconStyle;
  final String title;
  final String status;
  final int value;
  final String unit;
  final String time;
  final Color color;
  final Widget? placeholder;

  const BioDashboardItem({
    super.key,
    required this.icon,
    required this.iconStyle,
    required this.title,
    required this.status,
    required this.value,
    required this.unit,
    required this.time,
    required this.color,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  icon,
                  width: iconStyle.width,
                  height: iconStyle.height,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: color,
                      ),
                    ),
                    Text(
                      status,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          value.toString(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          unit,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Text(
              time,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        Container(
          height: 1,
          color: Colors.grey[200],
          margin: const EdgeInsets.symmetric(vertical: 16),
        ),
      ],
    );
  }
}
