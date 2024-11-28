import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants.dart';
import '../../../core/theme/constant/app_colors.dart';
import 'closet_category.dart';
import 'riverpod/closet_provider.dart';
import 'widgets/clothes_card.dart';
import 'widgets/custom_fab.dart';

class ClosetPage extends ConsumerStatefulWidget {
  const ClosetPage({super.key});

  @override
  ConsumerState<ClosetPage> createState() => _ClosetPageState();
}

class _ClosetPageState extends ConsumerState<ClosetPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(closetProvider.notifier).getMyClothes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final myCloset = ref.watch(closetProvider);

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
                final categoryClothes = myCloset.clothes[category] ?? [];

                return switch (myCloset.status) {
                  Status.initial ||
                  Status.loading =>
                    const Center(child: CircularProgressIndicator()),
                  Status.success => categoryClothes.isEmpty
                      ? Center(
                          child: Text(
                            "${category.label} 항목이 비어있습니다.",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        )
                      : GridView.builder(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                            top: 8.0,
                            bottom: 90.0,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 1,
                          ),
                          itemCount: categoryClothes.length,
                          itemBuilder: (context, index) => ClothesCard(
                            clothes: categoryClothes[index],
                          ),
                        ),
                  Status.error => const Text("에러임 ㅇㅇ;"),
                };
              }).toList(),
            ),
            const CustomFAB(),
          ],
        ),
      ),
    );
  }
}
