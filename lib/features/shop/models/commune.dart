// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Commune {
  String? id;
  String? postCode;
  String? name;
  String? wilayaId;
  String? arName;
  String? longitude;
  String? latitude;

  Commune({
    this.id,
    this.postCode,
    this.name,
    this.wilayaId,
    this.arName,
    this.longitude,
    this.latitude,
  });

  factory Commune.fromMap(Map<String, dynamic> json) {
    return Commune(
      id: json["id"],
      postCode: json["post_code"],
      name: json["name"],
      wilayaId: json["wilaya_id"],
      arName: json["ar_name"],
      longitude: json["longitude"],
      latitude: json["latitude"],
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["post_code"] = postCode;
    _data["name"] = name;
    _data["wilaya_id"] = wilayaId;
    _data["ar_name"] = arName;
    _data["longitude"] = longitude;
    _data["latitude"] = latitude;
    return _data;
  }
}

class CommuneList {
  final List<Commune> communeList;

  CommuneList(this.communeList);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'communeList': communeList.map((x) => x.toMap()).toList(),
    };
  }

  factory CommuneList.fromMap(Map<String, dynamic> map) {
    return CommuneList(
      List<Commune>.from(
        (map['data'] as List).map<Commune>(
          (x) => Commune.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CommuneList.fromJson(String source) =>
      CommuneList.fromMap(json.decode(source) as Map<String, dynamic>);
}
