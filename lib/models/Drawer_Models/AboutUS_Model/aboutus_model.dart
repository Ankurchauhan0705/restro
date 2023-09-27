class AboutusModel {
  AboutusModel({
     this.aboutUs,
  });
    List<AboutUs> ?aboutUs;

  AboutusModel.fromJson(Map<String, dynamic> json){
    aboutUs = List.from(json['about_us']).map((e)=>AboutUs.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['about_us'] = aboutUs!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class AboutUs {
  AboutUs({
     this.title,
     this.content,
     this.image,
  });
    String ?title;
    String ?content;
    String ?image;

  AboutUs.fromJson(Map<String, dynamic> json){
    title = json['title'];
    content = json['content'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['content'] = content;
    _data['image'] = image;
    return _data;
  }
}