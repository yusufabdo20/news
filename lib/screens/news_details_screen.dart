import 'package:flutter/material.dart';
import 'package:news/core/function/appUtills.dart';
import 'package:news/models/article_model.dart';
import 'package:news/screens/webViewScreen.dart';
import 'package:news/widgets/CustomHeadText.dart';
import 'package:news/widgets/customDivider.dart';
import 'package:news/widgets/custom_appBar.dart';
import 'package:news/widgets/custom_body_text.dart';

class NewDetailsScreen extends StatelessWidget {
  NewDetailsScreen({
    required this.articleModel,
  });
  ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(
          greenWord: 'News ',
          blackWord: 'details',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: articleModel.image != null
                    ? Image.network(
                        articleModel.image!,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        child: Text("No Image Available"),
                      ),
                width: double.infinity,
              ),
              SizedBox(
                height: 20,
              ),
              CustomHeadText(title: articleModel.title!),
              CustomDivider(),
              CustomBodyText(
                bodyText: articleModel.description ?? '',
              ),
              CustomDivider(),
              CustomBodyText(
                bodyText: articleModel.content ?? "",
                textColor: Colors.green,
                maxLine: 4,
                textSize: 15,
              ),
              TextButton.icon(
                  onPressed: () {
                    AppUtills.navigateTo(
                        context,
                        WebViewScreen(
                          articleModel: articleModel,
                        ));
                  },
                  icon:
                      Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
                  label: CustomBodyText(
                    bodyText: "Read more ...",
                    textWeight: FontWeight.bold,
                    // textColor: Colors.green,
                    textSize: 15,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
