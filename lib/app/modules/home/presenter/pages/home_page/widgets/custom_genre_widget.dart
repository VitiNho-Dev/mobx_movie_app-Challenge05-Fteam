import 'package:flutter/material.dart';

class CustomGenre extends StatefulWidget {
  const CustomGenre({
    Key? key,
    this.onTap,
    required this.name,
    this.isActive = false,
  }) : super(key: key);

  final void Function()? onTap;
  final String name;
  final bool isActive;

  @override
  State<CustomGenre> createState() => _CustomGenreState();
}

class _CustomGenreState extends State<CustomGenre> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.isActive
              ? const Color(0xff3d57bc)
              : const Color(0xff12162d),
        ),
        child: Text(
          widget.name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
