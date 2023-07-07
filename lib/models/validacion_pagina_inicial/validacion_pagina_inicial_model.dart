class VersionModel {
  VersionModel({
    this.id,
    this.version,
    this.so,
    this.url,
    this.activo,
  });

  String? id;
  String? version;
  String? so;
  String? url;
  bool? activo;

  factory VersionModel.fromJson(Map<String, dynamic> json) => VersionModel(
        id: json["Id"],
        version: json["Version"] == null ? null : json["Version"],
        so: json["So"] == null ? null : json["So"],
        url: json["Url"] == null ? null : json["Url"],
        activo: json["Activo"] == null ? null : json["Activo"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "Version": version == null ? null : version,
        "So": so == null ? null : so,
        "Url": url == null ? null : url,
        "Activo": activo == null ? null : activo,
      };
}
