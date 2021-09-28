class UserModel {
  late String id;
  late String name;
  late String email;
  late String type;
  UserModel(
      {required this.id, required this.name, required this.email , required this.type});

  UserModel.fromJson(Map <String, dynamic> map)
  {
    if (map == null) {
      return;
    }
    else {
      id = map['id'];
      name = map['name'];
      email = map['email'];
      type = map['type'];
    }
  }

  toJson()
  {
    return {
      'id':id,
      'name' : name,
      'email' : email,
      'type' : type,
    };
  }

}