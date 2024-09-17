import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/common/constants/app_colors.dart';

class CustomBottomSheet extends StatelessWidget {
  final String? title;
  final Widget content;
  final VoidCallback onClose;
  final double? height;

  const CustomBottomSheet({
    Key? key,
     this.title,
    required this.content,
    required this.onClose, this.height = 400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: AppColors.deepBg,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null ? Center(
            child:  Text(
                title!,
                style: const TextStyle(fontSize: 18,color: AppColors.white, fontWeight: FontWeight.bold),
              ),
          ): const Text('😊 😎 🚀 🎉 😊 😎 🚀 🎉 😊 😎 🚀 🎉 ', style: TextStyle(fontSize: 20),),
          const SizedBox(height: 10),
          content,
        ],
      ),
    );
  }
}

