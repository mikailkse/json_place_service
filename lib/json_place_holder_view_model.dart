import 'package:flutter/material.dart';
import 'package:flutter_service_http/model/post_model.dart';
import 'package:flutter_service_http/service/json_place_service.dart';
import 'json_place_holder.dart';

abstract class JsonPlaceHolderViewModel extends State<JsonPlaceHolder> {
  final baseUrl = "https://jsonplaceholder.typicode.com";
  
  List<PostModel> postModels = [];
  List<PostModel> albumModels = [];
  
  String errorMessage = "";
  
  bool isLoading = false;
  
  JsonPlaceService? jsonPlaceService;
  
  @override
  void initState() {
    super.initState();
    jsonPlaceService = JsonPlaceService();
  }

  Future<void> getPosts() async {
    changeLoading();
    try {
      postModels = await jsonPlaceService!.getPosts();
    } catch (e) {
      showErrorDialog(e.toString());
    }
    changeLoading();
  }

  Future<void> getAlbums() async {
    changeLoading();
    try {
      postModels = (await jsonPlaceService!.getAlbums()).cast<PostModel>();
    } catch (e) {
      showErrorDialog(e.toString());
    }
    changeLoading();
  }

  Future<void> showErrorDialog(String message) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Text(message),
      ),
    );
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
