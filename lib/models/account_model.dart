class AccountObject {
  String? accountname;
  String? email;
  String? phone;
  String? password;

  AccountObject({this.accountname, this.email, this.phone, this.password});

  AccountObject.fromJson(Map<String, dynamic> json)
      : accountname = json['accountname'],
        email = json['email'],
        phone = json['phone'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'accountname': accountname,
    'email': password,
    'phone': password,
    'password': password,
  };
}