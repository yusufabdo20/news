// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:news/core/function/appUtills.dart';
import 'package:news/models/article_model.dart';
import 'package:news/screens/news_details_screen.dart';

class CustomNewsItem extends StatelessWidget {
  ArticleModel articleModel;
  CustomNewsItem({
    required this.articleModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppUtills.navigateTo(
            context,
            NewDetailsScreen(
              articleModel: articleModel,
            ));
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                        articleModel.image ??
                            'https://icon-library.com/images/no-image-icon/no-image-icon-0.jpg',
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Text(
                articleModel.title ?? "",
                style: const TextStyle(
                  fontFamily: 'Play',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                articleModel.description ?? '',
                style: const TextStyle(
                  fontFamily: 'Play',
                  fontSize: 14,
                  // fontWeight: Font,
                  fontStyle: FontStyle.italic,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
