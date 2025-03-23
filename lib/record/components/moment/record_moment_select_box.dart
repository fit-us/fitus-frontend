import 'package:flutter/material.dart';

class RecordMomentSelectBox extends StatefulWidget {
  final String nowTimes;
  final Function(String) onSelect;
  final String? selectedMoment;

  const RecordMomentSelectBox({
    super.key,
    required this.nowTimes,
    required this.onSelect,
    this.selectedMoment,
  });

  @override
  State<RecordMomentSelectBox> createState() => RecordMomentSelectBoxState();
}

class RecordMomentSelectBoxState extends State<RecordMomentSelectBox> {
  String? _selectedMoment;

  @override
  void initState() {
    super.initState();
    _selectedMoment = widget.selectedMoment;
  }

  @override
  void didUpdateWidget(covariant RecordMomentSelectBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedMoment != oldWidget.selectedMoment) {
      setState(() {
        _selectedMoment = widget.selectedMoment;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _MomentButton(
          title: "지난 순간에 느꼈던 감정",
          time: widget.nowTimes,
          isSelected: _selectedMoment == "지난 순간에 느꼈던 감정",
          onTap: () {
            setState(() {
              _selectedMoment = "지난 순간에 느꼈던 감정";
            });
            widget.onSelect("지난 순간에 느꼈던 감정");
          },
        ),
        const SizedBox(height: 16),
        _MomentButton(
          title: "하루 동안의 전반적인 기분",
          isSelected: _selectedMoment == "하루 동안의 전반적인 기분",
          onTap: () {
            setState(() {
              _selectedMoment = "하루 동안의 전반적인 기분";
            });
            widget.onSelect("하루 동안의 전반적인 기분");
          },
        ),
      ],
    );
  }
}

class _MomentButton extends StatelessWidget {
  final String title;
  final String? time;
  final bool isSelected;
  final VoidCallback onTap;

  const _MomentButton({
    required this.title,
    this.time,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(),
              offset: const Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
          border:
              isSelected
                  ? Border.all(color: Colors.blue.shade600, width: 2)
                  : null,
          color: isSelected ? Colors.blue.shade50 : Colors.white,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.blue.shade600 : Colors.black,
                  ),
                ),
                if (isSelected)
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.shade600,
                    ),
                    child: const Center(
                      child: Text(
                        "✓",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            if (time != null)
              Row(
                children: [
                  const SizedBox(width: 4),
                  Text(
                    time!,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
