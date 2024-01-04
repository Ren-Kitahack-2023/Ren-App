import 'dart:convert';

VolunteerModel volunteerFromJson(String str) =>
    VolunteerModel.fromJson(json.decode(str));

String volunteerToJson(VolunteerModel data) => json.encode(data.toJson());

class VolunteerModel {
  VolunteerModel({
    required this.id,
    required this.name,
    required this.address,
    required this.location,
    required this.email,
    required this.rens,
    required this.profilePic,
  });

  String id;
  String name;
  String address;
  Location location;
  String email;
  List<Ren> rens;
  String profilePic; // url

  factory VolunteerModel.fromJson(Map<String, dynamic> json) => VolunteerModel(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        location: Location.fromJson(json["location"]),
        email: json["email"],
        rens: List<Ren>.from(json["rens"] == null
            ? []
            : json["rens"].map((x) => Ren.fromJson(x))),  
        profilePic: json["profilePic"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "location": location.toJson(),
        "email": email,
        "rens": List<dynamic>.from(rens.map((x) => x.toJson())),
        "profilePic": profilePic,
      };
}

class Ren {
  Ren({
    required this.id,
    required this.name,
    required this.location,
  });

  String id;
  String name;
  Location location;

  factory Ren.fromJson(Map<String, dynamic> json) => Ren(
        id: json["id"],
        name: json["name"],
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location.toJson(),
      };
}

class Location {
  Location({
    required this.long,
    required this.lat,
  });

  double long;
  double lat;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
      long: json["long"],
      lat: json["lat"],
    );

  Map<String, dynamic> toJson() => {
        "long": long,
        "name": lat,
      };
}