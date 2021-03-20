class Post {
  final String title;

  Post({this.title});

  factory Post.fromJson(Map<String, dynamic> json) {
    final title = json['title'];
    return Post(title: title);
  }
}
