import 'package:flutter/material.dart';
import 'package:store/views/home_screen/search_field.dart';

import 'category_list_builder.dart';
import 'search_result_builder.dart';
import 'title_bar.dart';
import 'discount_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SearchField(),
            DiscountBanner(),
            CategoryListBuilder(),
            SearchResultBuilder(),
          ],
        ),
      ),
    );
  }
}
