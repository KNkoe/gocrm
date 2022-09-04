import 'dart:convert';

class MyClient {
  String firstName;
  String lastName;
  String email;
  String mobile;
  String address;
  String status;
  DateTime birthday;
  String facebook;
  String twitter;
  String linkedin;
  String timezone;
  String details;
  MyClient({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.address,
    required this.status,
    required this.birthday,
    required this.facebook,
    required this.twitter,
    required this.linkedin,
    required this.timezone,
    required this.details,
  });

  MyClient copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? mobile,
    String? address,
    String? status,
    DateTime? birthday,
    String? facebook,
    String? twitter,
    String? linkedin,
    String? timezone,
    String? details,
  }) {
    return MyClient(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      address: address ?? this.address,
      status: status ?? this.status,
      birthday: birthday ?? this.birthday,
      facebook: facebook ?? this.facebook,
      twitter: twitter ?? this.twitter,
      linkedin: linkedin ?? this.linkedin,
      timezone: timezone ?? this.timezone,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'mobile': mobile,
      'address': address,
      'status': status,
      'birthday': birthday.millisecondsSinceEpoch,
      'facebook': facebook,
      'twitter': twitter,
      'linkedin': linkedin,
      'timezone': timezone,
      'details': details,
    };
  }

  factory MyClient.fromMap(Map<String, dynamic> map) {
    return MyClient(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      mobile: map['mobile'] as String,
      address: map['address'] as String,
      status: map['status'] as String,
      birthday: DateTime.fromMillisecondsSinceEpoch(map['birthday'] as int),
      facebook: map['facebook'] as String,
      twitter: map['twitter'] as String,
      linkedin: map['linkedin'] as String,
      timezone: map['timezone'] as String,
      details: map['details'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyClient.fromJson(String source) =>
      MyClient.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MyClient(firstName: $firstName, lastName: $lastName, email: $email, mobile: $mobile, address: $address, status: $status, birthday: $birthday, facebook: $facebook, twitter: $twitter, linkedin: $linkedin, timezone: $timezone, details: $details)';
  }

  @override
  bool operator ==(covariant MyClient other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.mobile == mobile &&
        other.address == address &&
        other.status == status &&
        other.birthday == birthday &&
        other.facebook == facebook &&
        other.twitter == twitter &&
        other.linkedin == linkedin &&
        other.timezone == timezone &&
        other.details == details;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        mobile.hashCode ^
        address.hashCode ^
        status.hashCode ^
        birthday.hashCode ^
        facebook.hashCode ^
        twitter.hashCode ^
        linkedin.hashCode ^
        timezone.hashCode ^
        details.hashCode;
  }
}
