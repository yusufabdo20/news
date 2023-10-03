// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:news/core/function/appUtills.dart';
import 'package:news/models/article_model.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/category_screen.dart';
import 'package:news/screens/news_details_screen.dart';
import 'package:news/screens/search_screen.dart';
import 'package:news/services/news_services.dart';
import 'package:news/widgets/CustomHeadText.dart';
import 'package:news/widgets/custom_appBar.dart';
import 'package:news/widgets/custom_category_item.dart';
import 'package:news/widgets/custom_listView_builder.dart';
import 'package:news/widgets/custom_listView_builder_category.dart';
import 'package:news/widgets/custom_news_item.dart';
import 'package:news/widgets/custom_sliver_List_news.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<CategoryModel> categoryModels = [
    CategoryModel(title: "Technology", imagePath: "assets/images/techno.jpg"),
    CategoryModel(title: "Sport", imagePath: "assets/images/sport1.jpeg"),
    CategoryModel(title: "Health", imagePath: "assets/images/health1.jpg"),
    CategoryModel(title: "Business", imagePath: "assets/images/business.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                AppUtills.navigateTo(context, SearchScreen());
              },
              icon: Icon(Icons.search))
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: CustomAppBar(
          greenWord: 'World ',
          blackWord: 'News',
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomHeadText(title: "Categories"),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 75,
                child: CustomListViewBuilderCategory(
                  categoryModels: categoryModels,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CustomHeadText(title: "General"),
            ),
            CustomListViewNewsItemsBuilder(category: 'general'),
          ],
        ),
      ),
    );
  }
}
