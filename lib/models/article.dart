class Article {
  String source;
  String title;
  String description;
  String url;
  String img;
  String date;
  String content;

  Article({
    this.source,
    this.title,
    this.description,
    this.url,
    this.img,
    this.date,
    this.content
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: json['source']['name'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      img: json['urlToImage'],
      date: json['publishedAt'],
      content: json['content']
    );
  }
}
