import 'package:nylo_framework/nylo_framework.dart';

class User extends Model {
  String? username;
  String? email;
  int? id;
  static StorageKey key = 'user';

  User() : super(key: key);

  User.fromJson(dynamic data) {
    username = data['username'];
    email = data['email'];
    id = data['id'];
  }

  @override
  toJson() => {"username": username, "email": email, 'id': id};
}
