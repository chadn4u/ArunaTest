class Posts {
  late int id;
  late int userId;
  late String title;
  late String body;

  Posts(
      {required this.id,
      required this.userId,
      required this.title,
      required this.body});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    body = json['body'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['code'] = this.code;
  //   data['messages'] = this.messages;
  //   if (this.data != null) {
  //     data['data'] = this.data!.toJson();
  //   }
  //   return data;
  // }
}

class PostList {
  late List<Posts> postList;

  PostList(this.postList);

  factory PostList.fromJson(List<dynamic> json) =>
      PostList(json.map((e) => Posts.fromJson(e)).toList());
}
