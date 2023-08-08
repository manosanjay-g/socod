
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginRequestEntity {
  String? email;
  String? password;


  LoginRequestEntity({
    this.email,
    this.password
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "password":password

  };
}
//api post response msg
class UserLoginResponseEntity {
  String? message;
  UserToken? res;

  UserLoginResponseEntity({
    this.message,
    this.res,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        message: json["message"],
        res: UserToken.fromJson(json["res"]),
      );
}


// login result
class UserItem {
  String? access_token;
  String? token;
  String? name;
  String? description;
  String? avatar;
  int? online;
  int? type;

  UserItem({
    this.access_token,
    this.token,
    this.name,
    this.description,
    this.avatar,
    this.online,
    this.type,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) =>
      UserItem(
        access_token: json["access_token"],
        token: json["token"],
        name: json["name"],
        description: json["description"],
        avatar: json["avatar"],
        online: json["online"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
    "access_token": access_token,
    "token": token,
    "name": name,
    "description": description,
    "avatar": avatar,
    "online": online,
    "type": type,
  };
}

class UserToken{
  final String? token;
  final String? id;


  UserToken({
    this.token,
    this.id,
  
  });

  factory UserToken.fromJson(Map<String, dynamic> json) =>
      UserToken(
        token: json["token"],
        id: json["id"],
        
      );

  Map<String, dynamic> toJson() => {
    "token": token,
    "id":id
   
  };

  
  
}

class UserData {
  final String? token;
  final String? name;
  final String? avatar;
  final String? description;
  final int? online;

  UserData({
    this.token,
    this.name,
    this.avatar,
    this.description,
    this.online,
  });

  factory UserData.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return UserData(
      token: data?['token'],
      name: data?['name'],
      avatar: data?['avatar'],
      description: data?['description'],
      online: data?['online'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (token != null) "token": token,
      if (name != null) "name": name,
      if (avatar != null) "avatar": avatar,
      if (description != null) "description": description,
      if (online != null) "online": online,
    };
  }
}


