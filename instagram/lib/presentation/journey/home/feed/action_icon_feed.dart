import 'package:flutter/material.dart';
import 'package:instagram/common/constants/app_colors.dart';

class ActionIconFeed extends StatelessWidget {
  const ActionIconFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,top: 16,bottom: 5),
      child: Row(
        children: [
          buildActionIcon(icon: Icons.favorite_outline, count: '23456'),
          buildActionIcon(icon: Icons.comment_outlined, count: '23456'),
          buildActionIcon(icon: Icons.send_outlined, count: '23456'),
          const Spacer(),
          buildActionIcon(icon: Icons.bookmark_outline, count: ''),
        ],
      ),
    );
  }

  Widget buildActionIcon({required IconData icon, required String count}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: AppColors.white,
            size: 28,
          ),
          const SizedBox(width: 4),
          if (count.isNotEmpty)
            Text(
              count,
              style: const TextStyle(color: AppColors.white, fontSize: 16),
            )
        ],
      ),
    );
  }
}
