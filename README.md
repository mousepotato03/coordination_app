# DRESSME

옷장 시뮬레이션 Flutter 프로젝트

실제 옷을 업로드하여 아바타에게 입히고, 생성형 AI에게 스타일 평가를 받아보세요. 또한, 자신의 신체 특징에 맞게 아바타를 커스터마이징하여 핏을 확인할 수 있습니다.

## Project Setting

- **Flutter SDK**: 3.22.2
- **Dart SDK**: 3.4.3

### 필수 설정 사항
- **Android NDK**: 23.1.7779620
- **Gradle**: 8.4.x
- **Android 실 기기 필요** (에뮬레이터 미지원)
- **API Key 설정 필요** (Kakao SDK, OpenAI API 등)
- **[imageConvert2UV server](https://github.com/mousepotato03/image_conversion_server) 실행 필요**

---

## Features

### 1. 아바타

사용자의 신체 정보를 ProfilePage에서 저장하고, 이를 기반으로 아바타를 생성하여 보여줍니다.

![아바타 예시](https://github.com/user-attachments/assets/bdea653f-766f-4960-bb24-8ee8fdb3d3c6)

BMI 계산을 통해 체형을 조정할 수 있으며, 체중 설정도 가능합니다.

![체형 조정](https://github.com/user-attachments/assets/8f64f898-21b7-4c6b-9bb2-65bd09992523)

### 2. 옷 입히기

> **참고:** 다양한 텍스처의 의상들을 지원하기 위해선 각각의 3D 모델링 작업이 추가로 필요합니다. 현재는 **반팔, 긴바지, 운동화**만 구현되어 있습니다.

옷장에 옷을 추가하려면 **이미지 변환 서버**가 실행 중이어야 합니다.

![옷 추가 예시](https://github.com/user-attachments/assets/b27d6c02-28c2-4f3e-8837-a9b985119906)

### 3. 스타일 평가하기

현재 OpenAI Assistants API를 활용하여 파인 튜닝된 모델이 스타일을 평가합니다.

![스타일 평가](https://github.com/user-attachments/assets/fefcc098-9cd6-4c0e-be36-685b74483b05)

### 4. 실험실 (Experimental Features)

향후 확장성을 고려해 새로운 기능을 테스트하는 공간입니다.

예를 들어, **커뮤니티 기능**을 추가하여 스타일 포스팅이나 의류 거래 기능을 구현할 계획이 있습니다.

#### 현재 실험 중인 기능
- **카카오 로그인 (자동 로그인 포함)**
- **메시지 보내기 (사진 전송 가능)**

