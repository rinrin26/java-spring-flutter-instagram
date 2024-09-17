import 'package:flutter/material.dart';
import 'package:instagram/common/constants/app_colors.dart';
import 'package:instagram/presentation/journey/home/comment/comment_section.dart';
import 'package:instagram/presentation/journey/home/feed/action_icon_feed.dart';
import 'package:instagram/presentation/journey/home/feed/header_feed.dart';
import 'package:instagram/presentation/journey/home/stories/stories_instagram.dart';
import 'package:instagram/presentation/widgets/expandible_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final String textUsername = 'Mila07478';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Text('Instagram',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppColors.white)),
          actions: [
            IconButton(
                onPressed: () => {},
                icon:
                    const Icon(Icons.favorite_outline, color: AppColors.white)),
            IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.mail_outline, color: AppColors.white))
          ],
        ),
        body: ListView(
          children: [
            StoriesInstagram(),
            const SizedBox(
              height: 15,
            ),
            buildFeedPost(),
            buildFeedPost(),
            buildFeedPost(),
            buildFeedPost(),
            buildFeedPost(),
          ],
        ));
  }

  Widget buildCaption() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ExpandableTextWidget(
        username: textUsername,
        text:
            'This example shows a message that was posted by a user. The username is always visible right before the text and tapping on it opens the user profile. The text is truncated after two lines and can be expanded by tapping on the link show more at the end or the text itself. After the text was expanded it cannot be collapsed again as no collapseText was provided. URLs, @mentions and #hashtags in the text are styled differently and can be tapped to open the browser or the user profile.',
        maxLines: 3,
        textStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.white),
      ),
    );
  }

  Widget buildFeedPost() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feeds.length,
      shrinkWrap: true,
      itemBuilder: (context,index){
        final feed = feeds[index];
        return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                 HeaderFeed(
                  username: feed['username'],
                  subName: feed['job'],
                  urlImgProfile: feed['imgProfileUrl'],
                  following: feed['following'],
                ),
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              feed['post_img']),
                          fit: BoxFit.cover)),
                ),
                const ActionIconFeed(),
                buildCaption(),
                 CommentSection(
                  postId: feed['postId'],
                  username: feed['username'],
                )
              ],
            ),
          );
      });
     }
  final List feeds = [
    {
      'postId': '1',
      'username':'Usman12',
      'job':'creator digital',
      'imgProfileUrl': 'https://i.pravatar.cc/150?img=3',
      'post_img': 'https://img.freepik.com/free-vector/instagram-sale-puzzle-feed_52683-62106.jpg?w=740&t=st=1726553178~exp=1726553778~hmac=f942f6dd87102fffd7ea5601d3faecb85182d37d5f1aa8f5d59524d0b77d4a1f',
      'following': false
    },
    {
      'postId': '2',
      'username':'rara3',
      'job':'creator digital',
      'imgProfileUrl': 'https://i.pravatar.cc/150?img=41',
      'post_img': 'https://img.freepik.com/premium-vector/instagram-puzzle-template-fashion-women-feed_182771-1490.jpg?w=740',
      'following': false
    },
    {
      'postId': '3',
      'username':'intan.berlin',
      'job':'creator digital',
      'imgProfileUrl': 'https://i.pravatar.cc/150?img=50',
      'post_img': 'https://img.freepik.com/free-vector/abstract-pack-social-media-puzzle-feed-posts_23-2148684191.jpg?w=740&t=st=1726553220~exp=1726553820~hmac=e28399d3edcecf2f7ea6dc9d4ba1234e49ff96a9f4c661dbdf2bad47f25f5965',
      'following': true
    },
    {
      'postId': '4',
      'username':'marcel.o',
      'job':'creator digital',
      'imgProfileUrl': 'https://i.pravatar.cc/150?img=24',
      'post_img': 'https://img.freepik.com/free-vector/instagram-puzzle-feed-collection_52683-49096.jpg?w=740&t=st=1726553237~exp=1726553837~hmac=17070379d9085ba5d0b2811ae6d6588699b6df289dce8f47d7dc4279d77abeca',
      'following': true
    },
    {
      'postId': '5',
      'username':'crish.34',
      'job':'creator digital',
      'imgProfileUrl': 'https://i.pravatar.cc/150?img=10',
      'post_img': 'https://img.freepik.com/free-vector/instagram-sale-puzzle-feed_52683-62107.jpg?w=740&t=st=1726553256~exp=1726553856~hmac=c26680127c17abd09d38f13fbf9a88fcf9b19efbe562e02b6ac9a10fc8e77bb7',
       'following': false
    },
    {
      'postId': '5',
      'username':'morgan.teo',
      'job':'creator digital',
      'imgProfileUrl': 'https://i.pravatar.cc/150?img=33',
      'post_img': 'https://img.freepik.com/free-psd/style-fashion-template-psd-set-social-media-ads_53876-138624.jpg?w=740&t=st=1726553267~exp=1726553867~hmac=0e9c4106b6151ac708815ca01e3064290c721b55e3f4304c8bbee7f5fffd0997',
       'following': true
    },
    {
      'postId': '6',
      'username':'merlin34',
      'job':'creator digital',
      'imgProfileUrl': 'https://i.pravatar.cc/150?img=47',
      'post_img': 'https://img.freepik.com/free-vector/instagram-puzzle-feed-template_23-2148676864.jpg?w=740&t=st=1726553284~exp=1726553884~hmac=ab2f3690bd7ce7c68837576b23bb4272094045915dbb0783c64b287c4d72dbd6',
       'following': true
    },
    {
      'postId': '7',
      'username':'hugo.ny',
      'job':'creator digital',
      'imgProfileUrl': 'https://i.pravatar.cc/150?img=15',
      'post_img': 'https://img.freepik.com/free-vector/instagram-botanic-puzzle-feed_52683-62108.jpg?w=740&t=st=1726553295~exp=1726553895~hmac=abd5a9df2590123d88a4e753ee34a8fe7883300da4c6f3ebde8803f77fc388af',
       'following': true
    },
    {
      'postId': '8',
      'username':'bryan.gu',
      'job':'creator digital',
      'imgProfileUrl': 'https://i.pravatar.cc/150?img=25',
      'post_img': 'https://img.freepik.com/free-vector/new-collection-sale-instagram-puzzle-feed_52683-48838.jpg?w=740&t=st=1726553304~exp=1726553904~hmac=d460889be8a9b0135c74c3ceeaa0fcc064736c25b3a56c409ea2612df33e6e3e',
       'following': true
    },
  ];
}
