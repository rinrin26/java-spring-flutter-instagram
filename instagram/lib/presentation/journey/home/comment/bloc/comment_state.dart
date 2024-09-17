part of 'comment_bloc.dart';
class CommentState  extends Equatable {
   final List<CommentModel> comment;
  const CommentState({this.comment = const []});

  @override
  List<Object> get props => [comment];
}


class CommentLoaded extends CommentState {
  final List<CommentModel> comments;
  final List<String>? lowStockcomments;

  const CommentLoaded({required this.comments, this.lowStockcomments});

  @override
   List<Object> get props => [comments];
}

class CommentError extends CommentState {
  final String message;

  const CommentError(this.message);

  @override
 List<Object> get props => [message];
}
