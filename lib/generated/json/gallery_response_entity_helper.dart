import 'package:gallery_grid_flutter/gallery_response_entity.dart';

galleryResponseEntityFromJson(
    GalleryResponseEntity data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id']?.toString();
  }
  if (json['photoPath'] != null) {
    data.photoPath = json['photoPath']?.toString();
  }
  if (json['name'] != null) {
    data.name = json['name']?.toString();
  }
  return data;
}

Map<String, dynamic> galleryResponseEntityToJson(GalleryResponseEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['photoPath'] = entity.photoPath;
  data['name'] = entity.name;
  return data;
}
