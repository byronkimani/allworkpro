class Address {
  Address({
    this.formattedAddress,
    this.placeName,
    this.placeId,
    this.latitude,
    this.longitude,
  });

  String? formattedAddress;
  double? latitude;
  double? longitude;
  String? placeId;
  String? placeName;
}
