class Comment {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Comment({this.postId, this.body, this.email, this.id, this.name});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      postId: json['postId'],
      body: json['body'],
      email: json['email'],
      id: json['id'],
      name: json['name'],
    );
  }
}
