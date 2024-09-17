import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/common/constants/app_colors.dart';
import 'package:instagram/data/models/comment_model.dart';
import 'package:instagram/presentation/journey/home/comment/bloc/comment_bloc.dart';
import 'package:instagram/presentation/widgets/custom_bottom_sheet.dart';
import 'package:instagram/presentation/widgets/text_input_widget.dart';

class CommentSection extends StatefulWidget {
  final String postId, username;

  const CommentSection(
      {super.key, required this.postId, required this.username});

  @override
  State<StatefulWidget> createState() => CommentSectionState();
}

class CommentSectionState extends State<CommentSection> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
    context.read<CommentBloc>().add(Getcomments());
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _showAddCommentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      isScrollControlled: true,
      builder: (context) => CustomBottomSheet(
        content:
            BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 27,
                backgroundImage:
                    NetworkImage('https://i.pravatar.cc/150?img=28'),
              ),
              const SizedBox(width: 16),
              TextFormInputWidget(
                controller: _commentController,
                width: 250,
                hintText: 'add comment here',
                focusNode: _focusNode,
              ),
              const SizedBox(width: 10),
              InkWell(
                  onTap: () {
                    print('send comment ============ ');
                    final dataComment = CommentModel(
                        postId: widget.postId,
                        username: widget.username,
                        commentText: _commentController.text);

                    context
                        .read<CommentBloc>()
                        .add(Addcomment(comment: dataComment));

                    _commentController.clear();
                  },
                  highlightColor: Colors.blue.withOpacity(0.1),
                  splashColor: Colors.blue.withOpacity(0.2),
                  child: const Icon(
                    Icons.send_sharp,
                    size: 25,
                    color: AppColors.white,
                  ))
            ],
          );
        }),
        onClose: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showCommentsBottomSheet(BuildContext context) {
    final state = context.read<CommentBloc>().state;

    if (state is CommentLoaded) {
      print('postId ${widget.postId}');
      print('state comments ${state.comment}');
      final filteredComments = state.comment
          .where((comment) => comment.postId == widget.postId)
          .toList();
      print('filteredComments ${filteredComments}');

      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
        isScrollControlled: true,
        builder: (context) => CustomBottomSheet(
          height: 550,
          title: 'Comments',
          content: filteredComments.isEmpty
              ? const Center(
                  child: Text(
                    'No comments for this post.',
                    style: TextStyle(color: AppColors.white),
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView.builder(
                    itemCount: filteredComments.length,
                    itemBuilder: (context, index) {
                      final comment = filteredComments[index];

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
                            radius: 27,
                            backgroundImage: NetworkImage(
                                'https://i.pravatar.cc/150?img=28'),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  comment.username,
                                  style:
                                      const TextStyle(color: AppColors.white),
                                ),
                                Text(
                                  comment.commentText,
                                  style:
                                      const TextStyle(color: AppColors.white),
                                ),
                                const Text('balas'),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.favorite_border,
                            size: 18,
                            color: AppColors.white,
                          ),
                        ],
                      );
                    },
                  ),
                ),
          onClose: () {
            Navigator.pop(context);
          },
        ),
      );
    } else if (state is CommentError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => _showCommentsBottomSheet(context),
            child: const Text(
              'Show all comments',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => _showAddCommentBottomSheet(context),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage:
                      NetworkImage('https://i.pravatar.cc/150?img=28'),
                ),
                SizedBox(width: 12),
                Text(
                  'Add comment...',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
