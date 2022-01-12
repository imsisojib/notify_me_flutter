class UserData {
  String? uid;
  String? userName;
  String? email;

  UserData({this.uid, this.userName, this.email});

  UserData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    userName = json['userName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['userName'] = this.userName;
    data['email'] = this.email;
    return data;
  }
}