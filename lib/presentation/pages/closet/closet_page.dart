import 'package:flutter/material.dart';

import '../../../core/theme/constant/app_colors.dart';
import 'closet_category.dart';

class ClosetPage extends StatelessWidget {
  const ClosetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: ClosetCategory.values.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: AppColors.primary,
            labelColor: AppColors.black,
            unselectedLabelColor: AppColors.black,
            tabs: ClosetCategory.values
                .map((category) => Tab(text: category.label))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: ClosetCategory.values.map((category) {
            return Center(
              child: Text('${category.label} 콘텐츠'),
            );
          }).toList(),
        ),
      ),
    );
  }
}
