class FetchRideEntity {
  bool? status;
  List<Rides>? rides;

  FetchRideEntity({this.status, this.rides});

  FetchRideEntity.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['rides'] != null) {
      rides = <Rides>[];
      json['rides'].forEach((v) {
        rides!.add(Rides.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (rides != null) {
      data['rides'] = rides!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rides {
  num? pickUpLocationLat;
  num? pickUpLocationLong;
  num? dropOffLocationLat;
  num? dropOffLocationLong;
  num? rider;
  num? driver;
  num? tripFare;
  num? numberOfSeats;
  String? totalRideTime;

  Rides(
      {this.pickUpLocationLat,
      this.pickUpLocationLong,
      this.dropOffLocationLat,
      this.dropOffLocationLong,
      this.rider,
      this.driver,
      this.tripFare,
      this.numberOfSeats,
      this.totalRideTime});

  Rides.fromJson(Map<String, dynamic> json) {
    pickUpLocationLat = json['pickUpLocationLat'];
    pickUpLocationLong = json['pickUpLocationLong'];
    dropOffLocationLat = json['dropOffLocationLat'];
    dropOffLocationLong = json['dropOffLocationLong'];
    rider = json['rider'];
    driver = json['driver'];
    tripFare = json['tripFare'];
    numberOfSeats = json['numberOfSeats'];
    totalRideTime = json['totalRideTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pickUpLocationLat'] = pickUpLocationLat;
    data['pickUpLocationLong'] = pickUpLocationLong;
    data['dropOffLocationLat'] = dropOffLocationLat;
    data['dropOffLocationLong'] = dropOffLocationLong;
    data['rider'] = rider;
    data['driver'] = driver;
    data['tripFare'] = tripFare;
    data['numberOfSeats'] = numberOfSeats;
    data['totalRideTime'] = totalRideTime;
    return data;
  }
}

class RequestRidePayload {
  String? pickUpLocationLat;
  String? pickUpLocationLong;
  String? dropOffLocationLat;
  String? dropOffLocationLong;
  int? rider;
  String? driver;
  String? totalRideTime;
  int? tripFare;
  int? numberOfSeats;
  String? date;
  String? time;

  RequestRidePayload(
      {this.pickUpLocationLat,
      this.pickUpLocationLong,
      this.dropOffLocationLat,
      this.dropOffLocationLong,
      this.rider,
      this.driver,
      this.totalRideTime,
      this.tripFare,
      this.numberOfSeats,
      this.date,
      this.time});

  RequestRidePayload.fromJson(Map<String, dynamic> json) {
    pickUpLocationLat = json['pickUpLocationLat'];
    pickUpLocationLong = json['pickUpLocationLong'];
    dropOffLocationLat = json['dropOffLocationLat'];
    dropOffLocationLong = json['dropOffLocationLong'];
    rider = json['rider'];
    driver = json['driver'];
    totalRideTime = json['totalRideTime'];
    tripFare = json['tripFare'];
    numberOfSeats = json['numberOfSeats'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pickUpLocationLat'] = pickUpLocationLat;
    data['pickUpLocationLong'] = pickUpLocationLong;
    data['dropOffLocationLat'] = dropOffLocationLat;
    data['dropOffLocationLong'] = dropOffLocationLong;
    data['rider'] = rider;
    data['driver'] = driver;
    data['totalRideTime'] = totalRideTime;
    data['tripFare'] = tripFare;
    data['numberOfSeats'] = numberOfSeats;
    data['date'] = date;
    data['time'] = time;
    return data;
  }
}
