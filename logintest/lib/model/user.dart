class User {
  var test = {
    "id": "1",
    "phone": "17858952904",
    "name": "hfy",
    "password": "123"
  };
  
  User({this.token, this.id, this.phone, this.name, this.password});
  final String id, phone, name, password, token;
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'],
      id: json['user']['id'],
      phone: json['user']['phone'],
      name: json['user']['name'],
      password: json['user']['password'],
    );
  }

  void login(String name, String password) async{
    if(test['name'] == name && test['password'] == password){
      print('成功');
    } else {
      print('失败');
    }
  }
}