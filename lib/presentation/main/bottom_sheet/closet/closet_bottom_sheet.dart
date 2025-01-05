import 'package:coordination_app/presentation/main/bottom_sheet/closet/widgets/closet_app_bar.dart';
import 'package:coordination_app/presentation/main/bottom_sheet/closet/widgets/closet_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants.dart';
import '../../../../core/theme/constant/app_colors.dart';
import 'closet_category.dart';
import 'riverpod/closet_provider.dart';
import 'widgets/clothes_card.dart';

class ClosetBottomSheet extends ConsumerStatefulWidget {
  const ClosetBottomSheet({super.key});

  @override
  ConsumerState<ClosetBottomSheet> createState() => _ClosetBottomSheetState();
}

class _ClosetBottomSheetState extends ConsumerState<ClosetBottomSheet> {
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

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      child: DefaultTabController(
        length: ClosetCategory.values.length,
        child: Scaffold(
          appBar: const ClosetBottomSheetAppBar(),
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
                              top: 58.0,
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
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: AppColors.primary,
                labelColor: AppColors.black,
                unselectedLabelColor: AppColors.black,
                tabs: ClosetCategory.values
                    .map((category) => Tab(text: category.label))
                    .toList(),
              ),
              const ClosetFAB(),
            ],
          ),
        ),
      ),
    );
  }
}
