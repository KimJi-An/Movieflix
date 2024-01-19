class MovieDetailModel {
  final String title, overview, posterPath, releaseDate;
  final bool adult;
  final List<Map<String, dynamic>> genres;
  final int id, runtime;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        overview = json['overview'],
        posterPath = json['poster_path'],
        releaseDate = json['release_date'],
        adult = json['adult'],
        genres = json['genres'],
        id = json['id'],
        runtime = json['runtime'];
}
