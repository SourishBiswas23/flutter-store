import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/controllers/categories_bloc/categories_bloc.dart';
import 'package:store/controllers/search_bloc/search_bloc.dart';
import 'package:store/views/home_screen/products_grid_builder.dart';

class SearchResultBuilder extends StatelessWidget {
  const SearchResultBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    final CategoriesBloc categoriesBloc =
        BlocProvider.of<CategoriesBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is Searching) {
            return const SizedBox(
              height: 300,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is ErrorSearchState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is ProductCategoryListState) {
            return ProductsGridBuilder(productsList: state.productList);
          } else if (state is ProductById) {
            categoriesBloc.add(DeselectItemsEvent());
            return ProductsGridBuilder(productsList: [state.product]);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
