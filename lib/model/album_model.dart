// ignore_for_file: annotate_overrides

import 'base_model.dart';

class AlbumModel extends IBaseModel<AlbumModel> {
  int? userId;
  int? id;
  String? title;

  AlbumModel({this.userId, this.id, this.title});

  AlbumModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    return data;
  }

  @override
  AlbumModel fromJson(Map<String, dynamic> json) => AlbumModel.fromJson(json);
}
