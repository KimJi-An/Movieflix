class MovieModel {
  final String title, backdropPath, overview, posterPath, releaseDate;
  final int id;

  MovieModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        backdropPath = json['backdrop_path'],
        overview = json['overview'],
        posterPath = json['poster_path'],
        releaseDate = json['release_date'],
        id = json['id'];
}
