import 'package:coordination_app/core/theme/custom/custom_font_weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/theme/constant/app_colors.dart';
import '../../../../../main/riverpod/user_state_provider.dart';

class ProfileWidget extends ConsumerWidget {
  const ProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userStateProvider).user;

    return Padding(
      padding: const EdgeInsets.only(top: 60, right: 30, left: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: Image.network(
              user?.kakaoAccount?.profile?.profileImageUrl ?? "",
              width: 110,
              height: 110,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            user?.kakaoAccount?.profile?.nickname ?? '무명의 사용자',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(
                  color: AppColors.black,
                )
                .regular,
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => ref.read(userStateProvider.notifier).logOut(),
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll<Color>(
                  AppColors.primary,
                ),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  '로그아웃',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(
                        color: AppColors.black,
                      )
                      .regular,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
