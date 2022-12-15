// To parse this JSON data, do
//
//     final farmer = farmerFromJson(jsonString);

import 'dart:convert';

List<Farmer> farmerFromJson(String str) =>
    List<Farmer>.from(json.decode(str).map((x) => Farmer.fromJson(x)));

String farmerToJson(List<Farmer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Farmer {
  Farmer({
    this.id,
    this.names,
    this.surname,
    this.dob,
    this.nid,
    this.maritalStatus,
    this.gender,
    this.languages,
    this.profession,
    this.contacts,
    this.email,
    this.address,
  });

  String? id;
  String? names;
  String? surname;
  DateTime? dob;
  String? nid;
  String? maritalStatus;
  String? gender;
  List<String>? languages;
  String? profession;
  String? contacts;
  String? email;
  Address? address;

  factory Farmer.fromJson(Map<String, dynamic> json) => Farmer(
        id: json["id"],
        names: json["names"],
        surname: json["surname"],
        dob: DateTime.parse(json["dob"]),
        nid: json["nid"],
        maritalStatus: json["maritalStatus"],
        gender: json["gender"],
        languages: json["languages"] != null
            ? List<String>.from(json["languages"]?.map((x) => x))
            : [],
        profession: json["profession"],
        contacts: json["contacts"],
        email: json["email"],
        address:
            json["address"] != null ? Address.fromJson(json["address"]) : null,
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "names": names,
        "surname": surname,
        "dob": dob?.toIso8601String(),
        "nid": nid,
        "maritalStatus": maritalStatus,
        "gender": gender,
        "languages": languages != null
            ? List<dynamic>.from(languages!.map((x) => x))
            : [],
        "profession": profession,
        "contacts": contacts,
        "email": email,
        "address": address!.toJson(),
      };
}

class Address {
  Address({
    this.city,
    this.country,
    this.street,
    this.district,
    this.continent,
    this.region,
  });

  String? city;
  String? country;
  String? street;
  String? district;
  String? continent;
  String? region;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        country: json["country"],
        street: json["street"],
        district: json["district"],
        continent: json["continent"],
        region: json["region"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "country": country,
        "street": street,
        "district": district,
        "continent": continent,
        "region": region,
      };
}
