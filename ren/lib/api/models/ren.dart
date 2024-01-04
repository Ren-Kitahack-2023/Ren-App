import 'dart:convert';

RenModel renFromJson(String str) =>
    RenModel.fromJson(json.decode(str));

String renToJson(RenModel data) => json.encode(data.toJson());

class RenModel {
  RenModel({
    required this.id,
    required this.name,
    required this.description,
    required this.status, 
    required this.location,
    required this.volunteers,
    required this.datetime,
  });

  String id;
  Location location;
  String name;
  String description;
  String status; // upcoming, in progress, completed
  List<Volunteer> volunteers;
  DateTime datetime;
  
  factory RenModel.fromJson(Map<String, dynamic> json) => RenModel(
      id: json["id"],
      location: Location.fromJson(json["location"]),
      name: json["name"],
      description: json["description"],
      status: json["status"],
      volunteers: List<Volunteer>.from(json["volunteers"] == null
          ? []
          : json["volunteers"].map((x) => Volunteer.fromJson(x))),  
      datetime: json["datetime"],
    );

  Map<String, dynamic> toJson() => {
        "id": id,
        "location": location.toJson(),
        "name": name,
        "description": description,
        "location": location.toJson(),
        "status": status,
        "volunteers": List<dynamic>.from(volunteers.map((x) => x.toJson())),
        "datetime": datetime,
      };
}

class Volunteer {
  Volunteer({
    required this.id,
    required this.email,
  });

  String id;
  String email;

  factory Volunteer.fromJson(Map<String, dynamic> json) => Volunteer(
        id: json["id"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
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