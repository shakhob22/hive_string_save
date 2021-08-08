import 'package:hive/hive.dart';
import 'package:hive_string_save/models/account_model.dart';
import 'package:hive_string_save/models/user_model.dart';

class UserDBObject {
  var box = Hive.box('user');

  void storeUser(UserObject user) async {
    box.put("user", user.toJson());
  }

  UserObject loadUser() {
    var user = new UserObject.fromJson(box.get('user'));
    return user;
  }

  void removeUser() async {
    box.delete("user");
  }
}

class AccountDBObject {
  var box = Hive.box('account');

  void storeUser(AccountObject account) async {
    box.put("account", account.toJson());
  }

  AccountObject loadUser() {
    var account = new AccountObject.fromJson(box.get('account'));
    return account;
  }

  void removeUser() async {
    box.delete("account");
  }
}

class UserDBString {
  var box = Hive.box('user');

  void storeUser(username, password) async {
    box.put("username", username);
    box.put("password", password);
  }

  List<String> loadUser() {
    String username = box.get("username");
    String password = box.get("password");
    return [
      username,
      password
    ];
  }

  void removeUser() async {
    box.delete("user");
  }
}

class AccountDBString {
  var box = Hive.box('account');

  void storeUser(username, email, phone, password) async {

    box.put("username", username);
    box.put("email", email);
    box.put("phone", phone);
    box.put("password", password);
  }

  List<String> loadUser() {
    String username = box.get("username");
    String email = box.get("email");
    String phone = box.get("phone");
    String password = box.get("password");
    return [
      username,
      email,
      phone,
      password
    ];
  }

  void removeAccount() async {
    box.delete("account");
  }
}