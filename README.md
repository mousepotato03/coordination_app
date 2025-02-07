# DRESSME

옷장 시뮬레이션 Flutter 프로젝트

실제 옷을 업로드하여 아바타에게 입히고, Generative AI에게 평가받아보세요. 또, 자신의 신체 특징에 맞게 아바타를 커스터마이징 하여 핏을 확인할 수 있습니다. 

## Project Setting

- Flutter SDK: 3.22.2
- Dart SDK: 3.4.3
  ### 반드시 설정해야할 내용
- Android NDK: 23.1.7779620
- gradle: 8.4.x 
- Android 실 기기(애뮬레이터는 지원하지 않음.)
- key(Kakao sdk, OpenAI api 등 별도의 세팅이 필요함.)
- [imageConvert2UV server](https://github.com/mousepotato03/image_conversion_server)

</br>

## Features

### 1. 아바타




https://github.com/user-attachments/assets/bdea653f-766f-4960-bb24-8ee8fdb3d3c6 

ProfilePage에서 저장한 사용자의 신체 정보를 아바타에 적용하여 보여줌.

https://github.com/user-attachments/assets/8f64f898-21b7-4c6b-9bb2-65bd09992523

체중도 설정 가능함. BMI를 계산해서 체형 특징이 수정됨. 



### 2. 옷 입히기

<span style="color: red;"> 아우터나 긴팔, 다양한 신발 등의 디자인 말고 "텍스쳐"가 달라지는 경우엔 3D 모델링을 각각 따로 만들어야 해서, 현재 반팔, 긴바지, 운동화만 구현되어 있음. </span>


이미지 변환 서버가 켜져있어야 옷장에 옷을 추가할 수 있음.


https://github.com/user-attachments/assets/b27d6c02-28c2-4f3e-8837-a9b985119906



### 3. 스타일 평가하기
현재는 OpenAI Assistants API를 사용하여 파인 튜닝된 모델이 스타일을 평가하고 있음.
 


https://github.com/user-attachments/assets/fefcc098-9cd6-4c0e-be36-685b74483b05

### 4. 실험실
현재로서 이 앱의 목적과 다소 떨어진 기능이긴 한데, 나중에 앱의 확장성을 고려했을 때 필요한 기능들을 모아두고 실험하려고 만듦. 

예를 들어, 커뮤니티 기능을 추가해서 스타일을 포스팅하거나 의류 거래를 하거나 등등.

지금까지 만들어둔 기능
- 카카오 로그인 (자동 로그인 포함)
- 메시지 보내기 (사진 보내기)

