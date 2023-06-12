import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  int? uId;
  @HiveField(1)
  String? shortName;
  @HiveField(2)
  String? fullname;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? phone;
  @HiveField(5)
  String? pwd;
  @HiveField(6)
  String? ppwd;
  @HiveField(7)
  String? date;
  @HiveField(8)
  String? pActive;

  UserModel(
      {this.uId,
      this.shortName,
      this.fullname,
      this.email,
      this.phone,
      this.pwd,
      this.ppwd,
      this.date,
      this.pActive});

  UserModel.fromJson(Map<String, dynamic> json) {
    uId = json['u_id'];
    shortName = json['short_name'];
    fullname = json['fullname'];
    email = json['email'];
    phone = json['phone'];
    pwd = json['pwd'];
    ppwd = json['ppwd'];
    date = json['date'];
    pActive = json['p_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['u_id'] = uId;
    data['short_name'] = shortName;
    data['fullname'] = fullname;
    data['email'] = email;
    data['phone'] = phone;
    data['pwd'] = pwd;
    data['ppwd'] = ppwd;
    data['date'] = date;
    data['p_active'] = pActive;
    return data;
  }
}
