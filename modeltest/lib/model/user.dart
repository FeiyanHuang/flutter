class User {
  User({this.info});
  final Map info;

  factory User.fromJson(Map<String, dynamic> json){
    return User(info: json);
  }
}

// Future<User> get