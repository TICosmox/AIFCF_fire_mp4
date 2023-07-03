import 'package:proyecto_reproductor_video/models/movieModel/movieModel.dart';

class NetflixContentModel{
  final List<MovieModel> list;
  final String tipoLista;
  NetflixContentModel({required this.list,required this.tipoLista});
}

List<NetflixContentModel> listNetflixContent=[
  NetflixContentModel(list: listMovieOscar,tipoLista: "De los premios Oscar"),
  NetflixContentModel(list: listMovieRecomendation,tipoLista: "Nuestra seleccion para Rodrigo" ),
  NetflixContentModel(list: listMovieAnimadas,tipoLista: "Peliculas Animadas"),
  NetflixContentModel(list: listMovieSeries,tipoLista: "Series"),
];