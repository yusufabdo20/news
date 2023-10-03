import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/models/article_model.dart';
import 'package:news/services/news_services.dart';
import 'package:news/widgets/CustomHeadText.dart';
import 'package:news/widgets/custom_sliver_List_news.dart';

class CustomListViewNewsItemsBuilder extends StatefulWidget {
  CustomListViewNewsItemsBuilder({
    super.key,
    required this.category,
  });
  String category;
  @override
  State<CustomListViewNewsItemsBuilder> createState() =>
      _CustomListViewNewsItemsBuilderState();
}

class _CustomListViewNewsItemsBuilderState
    extends State<CustomListViewNewsItemsBuilder> {
  var futureResponse;
  @override
  void initState() {
    super.initState();
    futureResponse =
        NewsServices(Dio()).getTobHeadLinesNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: futureResponse,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomListViewNewsItems(
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return CustomErrorTextMsg();
        } else {
          return CustomCircleLoadingIndicator();
        }
      },
    );
    // if (isLoading) {
    //   return SliverToBoxAdapter(
    //     child: Center(
    //       child: CircularProgressIndicator(
    //         backgroundColor: Colors.green,
    //         color: Colors.black,
    //       ),
    //     ),
    //   );
    // } else {
    //   if (articles.isNotEmpty) {
    //     return CustomListViewNewsItems(
    //       articles: articles,
    //     );
    //   } else {
    //     return SliverToBoxAdapter(
    //       child: Center(
    //         child: CustomHeadText(
    //           title: "OOPS!!! there is error , Try later",
    //           textColor: Colors.red,
    //         ),
    //       ),
    //     );
    //   }
    // }
  }
}

class CustomCircleLoadingIndicator extends StatelessWidget {
  const CustomCircleLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.green,
          color: Colors.black,
        ),
      ),
    );
  }
}

class CustomErrorTextMsg extends StatelessWidget {
  const CustomErrorTextMsg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: CustomHeadText(
          title: "OOPS!!! there is error , Try later",
          textColor: Colors.red,
        ),
      ),
    );
  }
}
