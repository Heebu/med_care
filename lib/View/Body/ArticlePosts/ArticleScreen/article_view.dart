import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../ViewModel/Body/ArticlePosts/ArticleScreen/article_viewmodel.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ArticleViewModel(),
      builder: (context, model, child) {
        return const Scaffold();
      },
    );
  }
}
