import 'dart:convert';

ResponseComics responseComicsFromMap(String str) =>
    ResponseComics.fromMap(json.decode(str));

class ResponseComics {
  ResponseComics({
    required this.code,
    required this.status,
    required this.data,
  });

  int code;
  String status;
  Data data;

  factory ResponseComics.fromMap(Map<String, dynamic> json) => ResponseComics(
        code: json["code"],
        status: json["status"],
        data: Data.fromMap(json["data"]),
      );
}

class Data {
  Data({
    required this.results,
  });

  List<Comic> results;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        results: List<Comic>.from(json["results"].map((x) => Comic.fromMap(x))),
      );
}

class Comic {
  Comic({
    required this.title,
    required this.poster,
  });

  String title;
  PosterImage poster;

  factory Comic.fromMap(Map<String, dynamic> json) => Comic(
        title: json["title"],
        poster: PosterImage.fromMap(json["thumbnail"]),
      );

  getFullPoster() {
    return '${poster.path}.jpg';
  }
}

class PosterImage {
  PosterImage({
    required this.path,
  });

  String path;

  factory PosterImage.fromMap(Map<String, dynamic> json) => PosterImage(
        path: json["path"],
      );
}
