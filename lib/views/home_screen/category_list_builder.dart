import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/controllers/categories_bloc/categories_bloc.dart';

import 'category_button.dart';

class CategoryListBuilder extends StatelessWidget {
  const CategoryListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CategoriesBloc categoriesBloc =
        BlocProvider.of<CategoriesBloc>(context);

    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CategoryButton(
              title: state.categories[index],
              isSelected: state.categories[index] == state.selectedCategory,
            ),
            itemCount: state.categories.length,
          ),
        );
      },
    );
  }
}
