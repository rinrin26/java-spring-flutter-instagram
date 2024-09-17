class CommentModel {
  final String? id;
  final String postId;
  final  String username;
  final String commentText;
  final DateTime? createdAt;

  CommentModel({this.id, required this.postId, required this.username, required this.commentText,  this.createdAt});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      postId: json['postId'],
      username: json['username'],
      commentText: json['commentText'],
      createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null
    );
  }
  
}