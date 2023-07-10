// To parse this JSON data, do
//
//     final video = videoFromJson(jsonString);

import 'dart:convert';

class Video {
    String? curso;
    String? video;
    String? snaphsot;
    String? ponente;
    String? descripcion;

    Video({
        this.curso,
        this.video,
        this.snaphsot,
        this.ponente,
        this.descripcion,
    });

    factory Video.fromRawJson(String str) => Video.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        curso: json["curso"],
        video: json["video"],
        snaphsot: json["snaphsot"],
        ponente: json["ponente"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toJson() => {
        "curso": curso,
        "video": video,
        "snaphsot": snaphsot,
        "ponente": ponente,
        "descripcion": descripcion,
    };
}
