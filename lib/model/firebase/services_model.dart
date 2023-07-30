class ServicesModel {
  String? uid;
  List<Service>? subService;
  String? icon;
  String? name;

  ServicesModel({this.uid, this.subService, this.icon, this.name});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    if (json['service'] != null) {
      subService = <Service>[];
      json['service'].forEach((v) {
        subService!.add(Service.fromJson(v));
      });
    }
    icon = json['icon'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    if (subService != null) {
      data['service'] = subService!.map((v) => v.toJson()).toList();
    }
    data['icon'] = icon;
    data['name'] = name;
    return data;
  }
}

class Service {
  String? imageUrl;
  String? title;
  List<String>? included;

  Service({this.imageUrl, this.title, this.included});

  Service.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    title = json['title'];
    included = json['included'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['title'] = title;
    data['included'] = included;
    return data;
  }
}