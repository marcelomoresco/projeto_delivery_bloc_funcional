class Place {
  final String placeId;
  final String name;
  final double lat;
  final double long;

  Place({
    this.placeId = '',
    this.name = '',
    required this.lat,
    required this.long,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      placeId: json['place_id'],
      name: json['formatted_address'],
      lat: json['geometry']['location']['lat'],
      long: json['geometry']['location']['lng'],
    );
  }
}
