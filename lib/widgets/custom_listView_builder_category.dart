import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/widgets/custom_category_item.dart';

class CustomListViewBuilderCategory extends StatelessWidget {
  const CustomListViewBuilderCategory({
    super.key,
    required this.categoryModels,
  });

  final List<CategoryModel> categoryModels;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ListView.builder(
          itemCount: categoryModels.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CustomCategoryItem(categoryModels[index]);
          }),
    );
  }
}
