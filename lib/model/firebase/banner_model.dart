class BannerModel {
  String? uid;
  String? bannerType;
  List<BannerIndividual>? bannerList;

  BannerModel({
    required this.uid,
    required this.bannerType,
    required this.bannerList,
  });

  BannerModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    if (json['bannerList'] != null) {
      bannerList = <BannerIndividual>[];
      json['bannerList'].forEach((v) {
        bannerList!.add(BannerIndividual.fromJson(v));
      });
    }
    bannerType = json['bannerType'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    if (bannerList != null) {
      data['bannerList'] = bannerList!.map((v) => v.toJson()).toList();
    }
    data['bannerType'] = bannerType;
    return data;
  }
}

class BannerIndividual {
  String? bannerUrl;
  String? bannerUid;

  BannerIndividual({this.bannerUrl, this.bannerUid,});

  BannerIndividual.fromJson(Map<String, dynamic> json) {
    bannerUrl = json['bannerUrl'];
    bannerUid = json['bannerUid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bannerUrl'] = bannerUrl;
    data['bannerUid'] = bannerUid;
    return data;
  }
}