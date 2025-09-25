class MovieDAO {
  int? idMovie;
  String? nameMovie;
  String? time;
  String? dateRelease;
  MovieDAO({this.idMovie, this.nameMovie, this.time, this.dateRelease});
  factory MovieDAO.fromMap(Map<String, dynamic> mapa){
    return MovieDAO(
      idMovie: mapa['idMovie'] ,
      nameMovie: mapa['nameMovie'] ,
      time: mapa['time'] ,
      dateRelease: mapa['dateRelease'],
    );
  }
  
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'idMovie': idMovie,
      'nameMovie': nameMovie,
      'time': time,
      'dateRelease': dateRelease,
    };
    return map;
  }

}