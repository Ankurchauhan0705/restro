class PhotoGalleryModel {
  PhotoGalleryModel({
     this.photosGallery,
  });
   List<PhotosGallery> ?photosGallery;

  PhotoGalleryModel.fromJson(Map<String, dynamic> json){
    photosGallery = List.from(json['photos_gallery']).map((e)=>PhotosGallery.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['photos_gallery'] = photosGallery!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class PhotosGallery {
  PhotosGallery({
     this.images,
  });
   String ?images;

  PhotosGallery.fromJson(Map<String, dynamic> json){
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['images'] = images;
    return _data;
  }
}