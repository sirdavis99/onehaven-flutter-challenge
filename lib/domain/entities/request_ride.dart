class RequestRideEntity {
  bool? status;
  CreatedRide? createdRide;
  List<ActiveRides>? activeRides;

  RequestRideEntity({this.status, this.createdRide, this.activeRides});

  RequestRideEntity.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    createdRide = json['createdRide'] != null
        ? CreatedRide.fromJson(json['createdRide'])
        : null;
    if (json['ActiveRides'] != null) {
      activeRides = <ActiveRides>[];
      json['ActiveRides'].forEach((v) {
        activeRides!.add(ActiveRides.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (createdRide != null) {
      data['createdRide'] = createdRide!.toJson();
    }
    if (activeRides != null) {
      data['ActiveRides'] = activeRides!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CreatedRide {
  int? id;
  String? pickUpLocationLat;
  String? pickUpLocationLong;
  String? dropOffLocationLat;
  String? dropOffLocationLong;
  String? rider;
  String? driver;
  String? totalRideTime;
  int? tripFare;
  int? numberOfSeats;
  String? updatedAt;
  String? createdAt;

  CreatedRide(
      {this.id,
      this.pickUpLocationLat,
      this.pickUpLocationLong,
      this.dropOffLocationLat,
      this.dropOffLocationLong,
      this.rider,
      this.driver,
      this.totalRideTime,
      this.tripFare,
      this.numberOfSeats,
      this.updatedAt,
      this.createdAt});

  CreatedRide.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pickUpLocationLat = json['pickUpLocationLat'];
    pickUpLocationLong = json['pickUpLocationLong'];
    dropOffLocationLat = json['dropOffLocationLat'];
    dropOffLocationLong = json['dropOffLocationLong'];
    rider = json['rider'].toString();
    driver = json['driver'].toString();
    totalRideTime = json['totalRideTime'];
    tripFare = json['tripFare'];
    numberOfSeats = json['numberOfSeats'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
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
    data['totalRideTime'] = totalRideTime;
    data['tripFare'] = tripFare;
    data['numberOfSeats'] = numberOfSeats;
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;
    return data;
  }
}

class ActiveRides {
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

  ActiveRides(
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

  ActiveRides.fromJson(Map<String, dynamic> json) {
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
