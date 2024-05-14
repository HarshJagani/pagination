// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  int id;
  String title;
  int year;
  String cover;
  String color;
  String label;
  int artistId;
  int listens;

  Welcome({
    required this.id,
    required this.title,
    required this.year,
    required this.cover,
    required this.color,
    required this.label,
    required this.artistId,
    required this.listens,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        title: json["title"],
        year: json["year"],
        cover: json["cover"],
        color: json["color"],
        label: json["label"],
        artistId: json["artistId"],
        listens: json["listens"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "year": year,
        "cover": cover,
        "color": color,
        "label": label,
        "artistId": artistId,
        "listens": listens,
      };
}
