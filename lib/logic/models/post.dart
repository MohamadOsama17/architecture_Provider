class Post {
  int postId;
  int userId;
  String title;
  String body;

  Post({this.body, this.postId, this.title, this.userId});

  factory Post.formJson(Map<String, dynamic> json) {
    return Post(
      body: json['body'],
      postId: json['id'],
      title: json['title'],
      userId: json['userId'],
    );
  }

//Dumy Data
  static List<Post> posts = List.generate(
    30,
    (int x) => Post(
        title: 'This is Post # ${x + 1}',
        body: 'hehehth erhth ethdm d dhtmeth ehmehm dm hetkkeheh'
            'dfdsdffdsfsdsdsdfsdfsdfsfssfv'
            'fdssdfdsfsdsdfsdfsdfsdfsdf'),
  );
}
