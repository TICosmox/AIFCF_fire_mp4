import 'package:proyecto_reproductor_video/models/movieModel/video_model.dart';

class CursoContentModel{
  final List<VideoModel> list;
  final String tipoLista;
  CursoContentModel({required this.list,required this.tipoLista});
}

List<CursoContentModel> listCursoContent=[
  CursoContentModel(list: listMovieRecomendation,tipoLista: "Nuestra seleccion para Rodrigo" ),
  CursoContentModel(list: listMovieAnimadas,tipoLista: "Peliculas Animadas"),
  CursoContentModel(list: listMovieSeries,tipoLista: "Series"),
];