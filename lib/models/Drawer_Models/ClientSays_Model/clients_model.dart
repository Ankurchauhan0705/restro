class ClientsModel {
  ClientsModel({
     this.siteReviewTitle,
     this.getSiteReview,
  });
    String ?siteReviewTitle;
    List<GetSiteReview> ?getSiteReview;

  ClientsModel.fromJson(Map<String, dynamic> json){
    siteReviewTitle = json['site_review_title'];
    getSiteReview = List.from(json['get_site_review']).map((e)=>GetSiteReview.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['site_review_title'] = siteReviewTitle;
    _data['get_site_review'] = getSiteReview!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class GetSiteReview {
  GetSiteReview({
     this.rating,
     this.name,
     this.title,
     this.content,
     this.date,
  });
    String ?rating;
    String ?name;
    String ?title;
    String ?content;
    String ?date;

  GetSiteReview.fromJson(Map<String, dynamic> json){
    rating = json['rating'];
    name = json['name'];
    title = json['title'];
    content = json['content'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['rating'] = rating;
    _data['name'] = name;
    _data['title'] = title;
    _data['content'] = content;
    _data['date'] = date;
    return _data;
  }
}