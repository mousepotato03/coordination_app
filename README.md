# DRESSME
가상 피팅룸 Flutter 프로젝트

실제 옷을 업로드하여 아바타에게 입히고, 생성형 AI를 통해 스타일 평가를 받아보세요. 또한, 자신의 신체 특징에 맞게 아바타를 커스터마이징하여 예상 핏을 확인할 수 있습니다.

## 프로젝트 환경
- **Flutter SDK**: 3.22.2
- **Dart SDK**: 3.4.3

### 필수 설정 사항
- **Android NDK**: 23.1.7779620
- **Gradle**: 8.4.x
- **Android 실제 기기 필요** (에뮬레이터는 지원하지 않음)
- **API Key 설정 필요** (Kakao SDK, OpenAI API 등)
- **[imageConvert2UV server](https://github.com/mousepotato03/image_conversion_server) 실행 필요**

---
## 주요 기능
### 1. 아바타
ProfilePage에서 사용자의 신체 정보를 입력하면, 이를 기반으로 맞춤형 아바타가 생성됩니다.

https://github.com/user-attachments/assets/bdea653f-766f-4960-bb24-8ee8fdb3d3c6

BMI에 기반하여 체형을 나타냅니다.

https://github.com/user-attachments/assets/8f64f898-21b7-4c6b-9bb2-65bd09992523

### 2. 옷 입히기
> **참고:** 다양한 텍스처의 의상을 지원하려면 각 의류별 3D 모델링 작업이 추가로 필요합니다. 현재는 **반팔 티셔츠, 긴바지, 운동화**만 구현되어 있습니다.

옷장에 새 의류를 추가하려면 **이미지 변환 서버**가 실행 중이어야 합니다.

https://github.com/user-attachments/assets/b27d6c02-28c2-4f3e-8837-a9b985119906

### 3. 스타일 평가
파인 튜닝된 OpenAI Assistants API 모델이 사용자의 스타일을 분석하고 평가합니다.

https://github.com/user-attachments/assets/fefcc098-9cd6-4c0e-be36-685b74483b05

### 4. 실험실
새로운 기능 테스트 공간입니다.
향후 **커뮤니티 기능**을 추가하여 스타일 공유나 의류 거래 기능을 제공할 계획입니다.

#### 현재 개발 중인 기능
- **카카오 로그인 (자동 로그인 지원)**
- **메시지 전송 기능 (이미지 첨부 가능)**
- **메모장 위젯 애니메이션**
  
https://github.com/user-attachments/assets/1f9d979d-cd8b-4de1-bedc-29f3936fbb91
