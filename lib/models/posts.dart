class Post {
  final String postTitle;
  final String postBody;
  final int userId;
  final int postId;
  Post({
    required this.postTitle,
    required this.postBody,
    required this.userId,
    required this.postId,
  });

  factory Post.FromJson(Map<String, dynamic> data) {
    return Post(
        postTitle: data["title"],
        postBody: data["body"],
        userId: data["userId"],
        postId: data["id"]);
  }
}
