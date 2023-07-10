// To parse this JSON data, do
//
//     final video = videoFromJson(jsonString);

import 'dart:convert';

class Video {
    String? titulo;
    String? video;
    String? nombreImagen;
    String? ponente;
    String? descripcion;
    String? duracion;
    String? key;

    Video({
        this.titulo,
        this.video,
        this.nombreImagen,
        this.ponente,
        this.descripcion,
        this.duracion,
        this.key,
    });

    factory Video.fromRawJson(String str) => Video.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        titulo: json["titulo"],
        video: json["video"],
        nombreImagen: json["nombreImagen"],
        ponente: json["ponente"],
        descripcion: json["descripcion"],
        duracion: json["duracion"],
        key: json["key"],
    );

    Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "video": video,
        "nombreImagen": nombreImagen,
        "ponente": ponente,
        "descripcion": descripcion,
        "duracion": duracion,
        "key": key,
    };
}
