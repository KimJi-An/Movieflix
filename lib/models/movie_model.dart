class MovieModel {
  final String title, poster;
  final int id;

  MovieModel.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      poster = json['poster_path'],
      id = json['id'];
}