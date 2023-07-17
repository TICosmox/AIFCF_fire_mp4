// To parse this JSON data, do
//
//     final modeloVideo = modeloVideoFromJson(jsonString);

import 'dart:convert';

List<ModeloVideo> modeloVideoFromJson(String str) => List<ModeloVideo>.from(json.decode(str).map((x) => ModeloVideo.fromJson(x)));

String modeloVideoToJson(List<ModeloVideo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModeloVideo {
    String? video;
    String? titulo;
    String? descripcion;
    String? nombreImagen;
    String? duracion;
    String? key;
    String? ponente;

    ModeloVideo({
        this.video,
        this.titulo,
        this.descripcion,
        this.nombreImagen,
        this.duracion,
        this.key,
        this.ponente,
    });

    factory ModeloVideo.fromJson(Map<String, dynamic> json) => ModeloVideo(
        video: json["video"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        nombreImagen: json["nombreImagen"],
        duracion: json["duracion"],
        key: json["key"],
        ponente: json["ponente"],
    );

    Map<String, dynamic> toJson() => {
        "video": video,
        "titulo": titulo,
        "descripcion": descripcion,
        "nombreImagen": nombreImagen,
        "duracion": duracion,
        "key": key,
        "ponente": ponente,
    };
}