class AuthenticationModel {
  final String? uid;
  final String? phone;

  AuthenticationModel({required this.uid, required this.phone});

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      AuthenticationModel(
        uid: json['uid'] as String?,
        phone: json['phone'] as String?,
      );
}
