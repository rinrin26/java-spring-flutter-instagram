import 'package:flutter/material.dart';
import 'package:instagram/common/constants/app_colors.dart';


class HeaderFeed extends StatelessWidget {
  final String username;
  final String? subName;
  final String urlImgProfile;
  final bool? following;

  const HeaderFeed(
      {super.key,
      required this.username,
      this.subName,
      required this.urlImgProfile, this.following=true});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildImgAvatar(urlImg: urlImgProfile),
          buildName(context),
          const Spacer(),
          buildActionIcon()
        ],
      ),
    );
  }

  Padding buildActionIcon() => Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            following != false ? TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: AppColors.deepBg, 
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), 
                ),
              ),
              child: const Text(
                'Follow',
                style: TextStyle(color: AppColors.blue, fontSize: 16),
              ),
            ): const Text(''),
            const Icon(
              Icons.more_vert,
              color: AppColors.white,
              size: 35,
            )
          ],
        ),
      );

  Padding buildName(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
            ),
            Text(
              subName!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white),
            )
          ],
        ),
      );
  Stack buildImgAvatar({required String urlImg}) => Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightBlue,
            ),
          ),
          CircleAvatar(
            radius: 23,
            backgroundImage: NetworkImage(urlImg),
          ),
        ],
      );
}
