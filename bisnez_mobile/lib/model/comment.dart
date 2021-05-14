class Comment {
  String authorName;
  String authorImageUrl;
  String text;

  Comment({
    this.authorName,
    this.authorImageUrl,
    this.text,
  });
}

final List<Comment> comments = [
  Comment(
    authorName: 'Angelo',
    authorImageUrl: 'assets/images/user2.jpeg',
    text: 'Bacana!!',
  ),
  Comment(
    authorName: 'Luana Souza',
    authorImageUrl: 'assets/images/user3.png',
    text: 'Gostei da foto...',
  ),
  Comment(
    authorName: 'Francisco',
    authorImageUrl: 'assets/images/user4.jpeg',
    text: 'Aguardando por mais posts :D',
  ),
  Comment(
    authorName: 'Joana Martins',
    authorImageUrl: 'assets/images/user1.jpg',
    text: 'Java é ruim',
  ),
  Comment(
    authorName: 'Sam Martin',
    authorImageUrl: 'assets/images/user11.png',
    text: 'Palmeiras não tem mundial',
  ),
];
