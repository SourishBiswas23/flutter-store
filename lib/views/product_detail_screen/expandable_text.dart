import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({super.key, required this.text});

  final String text;
  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  final maxLines = 2;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.text,
          maxLines: _isExpanded ? 100 : maxLines,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text(
            _isExpanded ? 'Read Less' : 'Read More',
            style: const TextStyle(fontSize: 16, color: Colors.deepOrange),
          ),
        )
      ],
    );
  }
}
