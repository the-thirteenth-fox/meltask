import 'package:flutter/material.dart';

class ChipComponent extends StatefulWidget {
  const ChipComponent(
    this.label, {
    Key? key,
    required this.color,
    this.wide = false,
    this.selectable = false,
  }) : super(key: key);

  final Color color;
  final String label;
  final bool wide;
  final bool selectable;

  @override
  State<ChipComponent> createState() => _ChipComponentState();
}

class _ChipComponentState extends State<ChipComponent> {
  bool? isSelected;
  @override
  Widget build(BuildContext context) {
    isSelected ??= !widget.selectable;
    return GestureDetector(
      onTap: widget.selectable
          ? () => setState(() => isSelected = !isSelected!)
          : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: widget.color),
          color: isSelected! ? widget.color : Colors.transparent,
        ),
        padding: widget.wide
            ? const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              )
            : const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
        child: Text(
          widget.label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
