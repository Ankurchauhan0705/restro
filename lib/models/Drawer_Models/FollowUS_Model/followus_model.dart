class FollowUSModel {
  FollowUSModel({
     this.followUs,
  });
   List<FollowUs> ?followUs;

  FollowUSModel.fromJson(Map<String, dynamic> json){
    followUs = List.from(json['follow_us']).map((e)=>FollowUs.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['follow_us'] = followUs!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class FollowUs {
  FollowUs({
     this.socialIcon,
     this.socialName,
     this.socialUrl,
  });
   String ?socialIcon;
   String ?socialName;
   String ?socialUrl;

  FollowUs.fromJson(Map<String, dynamic> json){
    socialIcon = json['social_icon'];
    socialName = json['social_name'];
    socialUrl = json['social_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['social_icon'] = socialIcon;
    _data['social_name'] = socialName;
    _data['social_url'] = socialUrl;
    return _data;
  }
}