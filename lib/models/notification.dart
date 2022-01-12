class NotificationInfo {
  String? to;
  Data? data;

  NotificationInfo({this.to, this.data});

  NotificationInfo.fromJson(Map<String, dynamic> json) {
    to = json['to'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['to'] = this.to;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? tittle;
  String? body;
  String? feature;

  Data({this.tittle, this.body, this.feature});

  Data.fromJson(Map<String, dynamic> json) {
    tittle = json['tittle'];
    body = json['body'];
    feature = json['feature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tittle'] = this.tittle;
    data['body'] = this.body;
    data['feature'] = this.feature;
    return data;
  }
}