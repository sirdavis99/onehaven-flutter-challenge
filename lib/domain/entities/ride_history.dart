class RideHistoryEntity {
  bool? status;
  List<RideHistory>? rideHistory;

  RideHistoryEntity({this.status, this.rideHistory});

  RideHistoryEntity.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['rideHistory'] != null) {
      rideHistory = <RideHistory>[];
      json['rideHistory'].forEach((v) {
        rideHistory!.add(RideHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (rideHistory != null) {
      data['rideHistory'] = rideHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RideHistory {
  int? id;
  String? pickUpLocationLat;
  String? pickUpLocationLong;
  String? dropOffLocationLat;
  String? dropOffLocationLong;
  String? rider;
  String? driver;
  String? tripFare;
  int? numberOfSeats;
  String? totalRideTime;
  String? createdAt;
  String? updatedAt;
  RiderDetails? riderDetails;
  RiderDetails? driverDetails;

  RideHistory(
      {this.id,
      this.pickUpLocationLat,
      this.pickUpLocationLong,
      this.dropOffLocationLat,
      this.dropOffLocationLong,
      this.rider,
      this.driver,
      this.tripFare,
      this.numberOfSeats,
      this.totalRideTime,
      this.createdAt,
      this.updatedAt,
      this.riderDetails,
      this.driverDetails});

  RideHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pickUpLocationLat = json['pickUpLocationLat'];
    pickUpLocationLong = json['pickUpLocationLong'];
    dropOffLocationLat = json['dropOffLocationLat'];
    dropOffLocationLong = json['dropOffLocationLong'];
    rider = json['rider'].toString();
    driver = json['driver'].toString();
    tripFare = json['tripFare'];
    numberOfSeats = json['numberOfSeats'];
    totalRideTime = json['totalRideTime'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    riderDetails = json['riderDetails'] != null
        ? RiderDetails.fromJson(json['riderDetails'])
        : null;
    driverDetails = json['driverDetails'] != null
        ? RiderDetails.fromJson(json['driverDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pickUpLocationLat'] = pickUpLocationLat;
    data['pickUpLocationLong'] = pickUpLocationLong;
    data['dropOffLocationLat'] = dropOffLocationLat;
    data['dropOffLocationLong'] = dropOffLocationLong;
    data['rider'] = rider;
    data['driver'] = driver;
    data['tripFare'] = tripFare;
    data['numberOfSeats'] = numberOfSeats;
    data['totalRideTime'] = totalRideTime;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (riderDetails != null) {
      data['riderDetails'] = riderDetails!.toJson();
    }
    if (driverDetails != null) {
      data['driverDetails'] = driverDetails!.toJson();
    }
    return data;
  }
}

class RiderDetails {
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? emailAddress;
  String? phoneNumber;
  String? gender;
  String? role;
  String? password;
  String? createdAt;
  String? updatedAt;

  RiderDetails(
      {this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.emailAddress,
      this.phoneNumber,
      this.gender,
      this.role,
      this.password,
      this.createdAt,
      this.updatedAt});

  RiderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    emailAddress = json['emailAddress'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
    role = json['role'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['middleName'] = middleName;
    data['lastName'] = lastName;
    data['emailAddress'] = emailAddress;
    data['phoneNumber'] = phoneNumber;
    data['gender'] = gender;
    data['role'] = role;
    data['password'] = password;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
