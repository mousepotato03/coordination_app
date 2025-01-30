import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';

import '../../../core/utils/exception/common_exception.dart';
import '../../../core/utils/logger.dart';
import '../../repository/user.repository.dart';
import '../base/local.usecase.dart';

class SendKakaoMsgUsecase extends LocalUsecase<UserRepository> {
  @override
  Future<void> call(UserRepository repository) async {
    // 카카오톡 실행 가능 여부 확인
    bool isKakaoTalkSharingAvailable =
        await ShareClient.instance.isKakaoTalkSharingAvailable();

    if (isKakaoTalkSharingAvailable) {
      try {
        Uri uri =
            await ShareClient.instance.shareDefault(template: defaultFeed);
        await ShareClient.instance.launchKakaoTalk(uri);
      } catch (e) {
        CustomLogger.logger.e(e.toString());
        throw CommonException.setError(e);
      }
    } else {
      try {
        Uri shareUrl = await WebSharerClient.instance
            .makeDefaultUrl(template: defaultFeed);
        await launchBrowserTab(shareUrl, popupOpen: true);
      } catch (e) {
        CustomLogger.logger.e(e.toString());
        throw CommonException.setError(e);
      }
    }
  }
}

final FeedTemplate defaultFeed = FeedTemplate(
  content: Content(
    imageUrl: Uri.parse('https://i.ibb.co/mCpg1SCT/pepe1.png'),
    link: Link(
        webUrl:
            Uri.parse('https://youtu.be/4rXPYs_1bio?si=mabhtg3HNZcyA1PL&t=6'),
        mobileWebUrl:
            Uri.parse('https://youtu.be/4rXPYs_1bio?si=mabhtg3HNZcyA1PL&t=6')),
  ),
);
