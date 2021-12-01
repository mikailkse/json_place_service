import 'package:flutter_service_http/model/album_model.dart';
import 'package:flutter_service_http/model/post_model.dart';
import 'package:flutter_service_http/service/base_service.dart';

class JsonPlaceService extends BaseService {
  Future<List<PostModel>> getPosts() async {
    return await get<PostModel>("posts", model: PostModel());
  }

  Future<List<AlbumModel>> getAlbums() async {
    return await get("albums", model: AlbumModel());
  }
}
