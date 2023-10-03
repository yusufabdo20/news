import 'package:dio/dio.dart';
import 'package:news/core/function/appUtills.dart';
import 'package:news/models/article_model.dart';

class NewsServices {
  final Dio dio;
  NewsServices(this.dio);
  Future<List<ArticleModel>> getTobHeadLinesNews(
      {required String category}) async {
    try {
      Response response = await dio.get(
          "${AppUtills.baseUrl}/v2/top-headlines?apiKey=${AppUtills.apiKey}&country=us&category=$category");
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articleModelList = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articleModelList.add(articleModel);
      }
      return articleModelList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<ArticleModel>> getEveryThingNews({required String query}) async {
    try {
      Response response = await dio.get(
          "${AppUtills.baseUrl}/v2/everything?q=$query&apiKey=${AppUtills.apiKey}");
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articleModelList = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articleModelList.add(articleModel);
      }
      return articleModelList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
