import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/models/article_model.dart';
import 'package:news/services/news_services.dart';
import 'package:news/widgets/custom_news_item.dart';

class CustomListViewNewsItems extends StatelessWidget {
  List<ArticleModel> articles;
  CustomListViewNewsItems({required this.articles});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return CustomNewsItem(
            articleModel: articles[index],
          );
        },
      ),
    );
  }
}
