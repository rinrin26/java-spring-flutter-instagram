import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle? textStyle;
  final String? username;

  const ExpandableTextWidget({super.key, required this.text, required this.maxLines,  this.textStyle, this.username});
  @override
  State<StatefulWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  @override
  Widget build(BuildContext context) {
    return  ExpandableText(
      widget.text,
      style: widget.textStyle,
      prefixText: widget.username,
      expandText: 'show more',
      maxLines: widget.maxLines,
      linkColor: Colors.blue,
      animation: true,
      collapseOnTextTap: true,
    
      prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
   
      hashtagStyle: const TextStyle(
        color: Color(0xFF30B6F9),
      ),
      mentionStyle: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
     
      urlStyle: const TextStyle(
        decoration: TextDecoration.underline,
      ),
    );
  }
  
}