import 'package:flutter/material.dart';
import 'package:instagram/presentation/widgets/avatar_circle.dart';

class StoriesInstagram extends StatelessWidget {
  final List<Map<String, dynamic>> currentUserStories = [
    {'urlImgProfile': 'https://i.pravatar.cc/150?img=28', 'hasStories': false},
    {'urlImgProfile': 'https://i.pravatar.cc/150?img=41', 'hasStories': true},
    {'urlImgProfile': 'https://i.pravatar.cc/150?img=3', 'hasStories': true},
    {'urlImgProfile': 'https://i.pravatar.cc/150?img=10', 'hasStories': true},
    {'urlImgProfile': 'https://i.pravatar.cc/150?img=2', 'hasStories': true},
    {'urlImgProfile': 'https://i.pravatar.cc/150?img=46', 'hasStories': true},
    {'urlImgProfile': 'https://i.pravatar.cc/150?img=44', 'hasStories': true},
    {'urlImgProfile': 'https://i.pravatar.cc/150?img=33', 'hasStories': true},
    {'urlImgProfile': 'https://i.pravatar.cc/150?img=22', 'hasStories': true},
    {'urlImgProfile': 'https://i.pravatar.cc/150?img=11', 'hasStories': true}
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        shrinkWrap: true,
        itemCount: currentUserStories.length,
        itemBuilder: (context, index) {
          final item = currentUserStories[index];
          if (index == 0) {
            return Stack(
              children: [
                AvatarCircle(
                  urlImgProfile: item['urlImgProfile'],
                  hasStories: item['hasStories'],
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return AvatarCircle(
              urlImgProfile: item['urlImgProfile'],
              hasStories: item['hasStories'],
            );
          }
        },
      ),
    );
  }
}
