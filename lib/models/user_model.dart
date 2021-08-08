class UserObject {
  String? username;
  String? password;

  UserObject({this.username, this.password});

  UserObject.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
  };
}