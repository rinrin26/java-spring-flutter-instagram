import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/data/models/comment_model.dart';
import 'package:instagram/services/api_instagram_service.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final ApiInstagramService apiInstagramService;
  CommentBloc(this.apiInstagramService): super(const CommentState()){
    print('initial bloc comment');
    on<Addcomment>((event,emit) async {
      print('receive state add comment ${event.comment}');
      await apiInstagramService.addcomment(event.comment.postId, event.comment.username, event.comment.commentText);
    });

    on<Getcomments>((event, emit) async {
      try {
        final comments = await apiInstagramService.getComments();
        print('result get comments $comments');
        emit(CommentLoaded(comments: comments));
      } catch (e) {
        print('error get comments $e');
        emit(const CommentError('failed to fetch comments'));
      }
    });
  }
}