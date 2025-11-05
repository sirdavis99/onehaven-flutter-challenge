class Member {
  final String id;
  final String firstName;
  final String lastName;
  final int birthYear;
  final String relationship;
  final String avatar;
  final String status;
  final bool screenTimeEnabled;

  Member({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthYear,
    required this.relationship,
    required this.avatar,
    required this.status,
    required this.screenTimeEnabled,
  });

  int get age => DateTime.now().year - birthYear;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json['id']?.toString() ?? '',
        firstName: json['firstName'] ?? '',
        lastName: json['lastName'] ?? '',
        birthYear: (json['birthYear'] is int)
            ? json['birthYear'] as int
            : int.tryParse(json['birthYear']?.toString() ?? '0') ?? 0,
        relationship: json['relationship'] ?? '',
        avatar: json['avatar'] ?? '',
        status: json['status'] ?? '',
        screenTimeEnabled: (json['screenTimeEnabled'] as bool?) ?? false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'birthYear': birthYear,
        'relationship': relationship,
        'avatar': avatar,
        'status': status,
        'screenTimeEnabled': screenTimeEnabled,
      };

  Member copyWith({
    String? id,
    String? firstName,
    String? lastName,
    int? birthYear,
    String? relationship,
    String? avatar,
    String? status,
    bool? screenTimeEnabled,
  }) {
    return Member(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthYear: birthYear ?? this.birthYear,
      relationship: relationship ?? this.relationship,
      avatar: avatar ?? this.avatar,
      status: status ?? this.status,
      screenTimeEnabled: screenTimeEnabled ?? this.screenTimeEnabled,
    );
  }
}
