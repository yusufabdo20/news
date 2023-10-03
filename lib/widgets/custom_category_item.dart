import 'package:flutter/material.dart';
import 'package:news/core/function/appUtills.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/category_screen.dart';

class CustomCategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  CustomCategoryItem(this.categoryModel);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppUtills.navigateTo(
            context,
            CategoryScreen(
              titleOfCategory: categoryModel.title,
              categryType: categoryModel.title.toLowerCase(),
            ));
      },
      child: Container(
        height: 75,
        width: 150,
        alignment: Alignment.center,
        // padding: EdgeInsets.all(25),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(categoryModel.imagePath),
            opacity: .8,
            fit: BoxFit.cover,
          ),
        ),
        child: Text(
          categoryModel.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Play',
          ),
        ),
      ),
    );
  }
}
