part of 'comment_bloc.dart';
sealed class CommentEvent extends Equatable {
  const CommentEvent();
  @override
  List<Object> get props => [];
}

class Getcomments extends CommentEvent {}

class Addcomment extends CommentEvent {
  final CommentModel comment;

  const Addcomment({required this.comment});
  @override
  List<Object> get props => [comment];
}

class Updatecomment extends CommentEvent {
  final List<CommentModel> comment;

  const Updatecomment({required this.comment});
  @override
  List<Object> get props => [comment];
}

class RemovecommentEvent extends CommentEvent {
  final String commentId;

  const RemovecommentEvent(this.commentId);

  @override
  List<Object> get props => [commentId];
}

