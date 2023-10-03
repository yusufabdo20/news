class ArticleModel {
  final String? image;
  final String? title;
  final String? description;
  final String? content;
  final String? url;
  ArticleModel({
    required this.image,
    required this.title,
    required this.description,
    required this.content,
    required this.url,
  });
  factory ArticleModel.fromJson(dynamic json) {
    return ArticleModel(
      image: json['urlToImage'],
      title: json['title'],
      description: json['description'],
      content: json['content'],
      url: json['url'],
    );
  }
}

// class Source {
//   String id;
//   String name;
//   Source({
//     required this.id,
//     required this.name,
//   });
// }
