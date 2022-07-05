import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PhotoModel {
  
  final String id;
  final String title;
  final String urlImage;
  PhotoModel({
    required this.id,
    required this.title,
    required this.urlImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'urlImage': urlImage,
    };
  }

  factory PhotoModel.fromMap(Map<String, dynamic> map) {
    return PhotoModel(
      id: map['id'] as String,
      title: map['title'] as String,
      urlImage: map['urlImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhotoModel.fromJson(String source) => PhotoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
