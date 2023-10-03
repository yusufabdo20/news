import 'package:flutter/material.dart';

import 'package:news/widgets/custom_appBar.dart';
import 'package:news/widgets/custom_listView_builder.dart';
import 'package:news/widgets/custom_news_item.dart';
import 'package:news/widgets/custom_sliver_List_news.dart';

class CategoryScreen extends StatelessWidget {
  String titleOfCategory;
  String categryType;
  CategoryScreen({
    this.titleOfCategory = '',
    required this.categryType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(
          blackWord: titleOfCategory,
        ),
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          CustomListViewNewsItemsBuilder(category: this.categryType),
        ],
      )),
    );
  }
}
