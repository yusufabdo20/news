import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/models/article_model.dart';
import 'package:news/services/news_services.dart';
import 'package:news/widgets/custom_appBar.dart';
import 'package:news/widgets/custom_body_text.dart';
import 'package:news/widgets/custom_news_item.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = '';
  bool isLoading = true;
  List<ArticleModel> searchedResults = [];

  Future searchOnNews() async {
    searchedResults =
        await NewsServices(Dio()).getEveryThingNews(query: searchText);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(
          blackWord: 'Search',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CustomTextField(
              onChange: (value) {
                searchText = value;
                searchOnNews();
              },
            ),
            Expanded(
                child: isLoading == true
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: searchedResults.length,
                        itemBuilder: (context, index) {
                          return CustomNewsItem(
                              articleModel: searchedResults[index]);
                        },
                      ))
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.onChange,
  });
  Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      decoration: InputDecoration(
        labelText: "Search",
        labelStyle: TextStyle(color: Colors.green),
        hintText: "Search on news",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide: BorderSide(color: Colors.green, width: 2),
        ),
      ),
    );
  }
}
