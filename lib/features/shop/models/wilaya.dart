// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Wilaya {
  String id;
  String code;
  String name;
  String arName;
  String longitude;
  String latitude;

  Wilaya(
      {required this.id,
      required this.code,
      required this.name,
      required this.arName,
      required this.longitude,
      required this.latitude});

  factory Wilaya.fromMap(Map<String, dynamic> map) {
    return Wilaya(
      id: map["id"],
      code: map["code"],
      name: map["name"],
      arName: map["ar_name"],
      longitude: map["longitude"],
      latitude: map["latitude"],
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["code"] = code;
    _data["name"] = name;
    _data["ar_name"] = arName;
    _data["longitude"] = longitude;
    _data["latitude"] = latitude;
    return _data;
  }
}

class WilayaList {
  final List<Wilaya> wilayaList;

  WilayaList(this.wilayaList);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'wilayaList': wilayaList.map((x) => x.toMap()).toList(),
    };
  }

  factory WilayaList.fromMap(Map<String, dynamic> map) {
    return WilayaList(
      List<Wilaya>.from(
        (map['data'] as List).map<Wilaya>(
          (x) => Wilaya.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory WilayaList.fromJson(String source) =>
      WilayaList.fromMap(json.decode(source) as Map<String, dynamic>);
}
