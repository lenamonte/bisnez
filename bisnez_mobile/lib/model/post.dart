class Post {
  String authorName;
  String authorImageUrl;
  DateTime date;
  String imageUrl;
  String body;

  Post(
      {this.authorName,
      this.authorImageUrl,
      this.date,
      this.imageUrl,
      this.body});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      authorName: json["authorName"],
      authorImageUrl: json["authorImageUrl"],
      date: DateTime.now(),
      imageUrl: json["imageUrl"],
      body: json["body"]);
}

final List<String> stories = [
  'assets/images/user1.jpg',
  'assets/images/user2.jpeg',
  'assets/images/user3.png',
  'assets/images/user4.jpeg',
  'assets/images/user5.png',
  'assets/images/user6.png',
  'assets/images/user7.jpeg',
  'assets/images/user8.jpg',
  'assets/images/user9.jpg',
  'assets/images/user10.jpeg',
  'assets/images/user11.png',
];
