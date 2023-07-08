import 'dart:convert';

ModeloRegistro modeloRegistroFromJson(String str) => ModeloRegistro.fromJson(json.decode(str));

String modeloRegistroToJson(ModeloRegistro data) => json.encode(data.toJson());

class ModeloRegistro {
    String? nombrecompleto;
    String? matricula;

    ModeloRegistro({
        this.nombrecompleto,
        this.matricula,
    });

    factory ModeloRegistro.fromJson(Map<String, dynamic> json) => ModeloRegistro(
        nombrecompleto: json["nombrecompleto"],
        matricula: json["matricula"],
    );

    Map<String, dynamic> toJson() => {
        "nombrecompleto": nombrecompleto,
        "matricula": matricula,
    };
}
