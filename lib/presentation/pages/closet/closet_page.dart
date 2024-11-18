import 'package:flutter/material.dart';

import '../../../core/theme/constant/app_colors.dart';
import 'widgets/custom_fab.dart';
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
        body: Stack(
          children: [
            TabBarView(
              children: ClosetCategory.values.map((category) {
                return GridView.builder(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    top: 8.0,
                    bottom: 90.0,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 1,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const CustomFAB(),
          ],
        ),
      ),
    );
  }
}

