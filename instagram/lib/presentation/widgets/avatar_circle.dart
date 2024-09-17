import 'package:flutter/material.dart';

class AvatarCircle extends StatelessWidget {
  final String urlImgProfile;
  final bool hasStories;

  const AvatarCircle({super.key, required this.urlImgProfile, required this.hasStories});
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 105,
          height: 105,
          decoration:  BoxDecoration(
            shape: BoxShape.circle,
            color: hasStories ? Colors.purple : Colors.grey.shade500,
          ),
        ),
        Container(
          width: 95,
          height: 95,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
        ),
        CircleAvatar(
          radius: 47,
          backgroundImage: NetworkImage(urlImgProfile),
        ),
       
      ],

    );
  }
  
}