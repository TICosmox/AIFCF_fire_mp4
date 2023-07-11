// To parse this JSON data, do
//
//     final video = videoFromJson(jsonString);

import 'dart:convert';

Video videoFromJson(String str) => Video.fromJson(json.decode(str));

String videoToJson(Video data) => json.encode(data.toJson());

class Video {
    String? titulo;
    String? descripcion;
    String? nombreImagen;
    String? duracion;
    String? curso;
    String? key;

    Video({
        this.titulo,
        this.descripcion,
        this.nombreImagen,
        this.duracion,
        this.curso,
        this.key,
    });

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        nombreImagen: json["nombreImagen"],
        duracion: json["duracion"],
        curso: json["curso"],
        key: json["key"],
    );

    Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "descripcion": descripcion,
        "nombreImagen": nombreImagen,
        "duracion": duracion,
        "curso": curso,
        "key": key,
    };
}
