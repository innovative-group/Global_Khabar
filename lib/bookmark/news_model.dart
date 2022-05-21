class NewsModel {
  int? id;
  String title;
  String desc;

  NewsModel({this.id, required this.title, required this.desc});

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json['id'],
        title: json['name'],
        desc: json['contact'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': title,
        'contact': desc,
      };
}
