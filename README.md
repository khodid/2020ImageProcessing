# 2020ImageProcessing
2020년 2학기 영상처리 수업
Image Processing Lecture, Fall Semester, 2020

## 1. 과제
- 이론적으로 배웠던 걸 직접 눈으로 확인해보는 데 의의가 있는 소소한 과제물들
- 매트랩 내장함수로 편하게 실습했었음

|No.|제출본|소스 코드|내용|
|:---:|:---|:---|:---|
|1|[여기](https://github.com/khodid/2020ImageProcessing/blob/main/pdf/%EC%98%81%EC%83%81%EC%B2%98%EB%A6%AC_HW1_18010697%EA%B9%80%ED%95%B4%EB%A6%AC.pdf)|없음|MATLAB 기본 연산, plot 출력|
|2|[여기](https://github.com/khodid/2020ImageProcessing/blob/main/pdf/%EC%98%81%EC%83%81%EC%B2%98%EB%A6%AC_HW2_18010697%EA%B9%80%ED%95%B4%EB%A6%AC.pdf)|없음|이미지 파일 불러오기, 디스플레이, 저장 형식 변환하기|
|3|[여기](https://github.com/khodid/2020ImageProcessing/blob/main/pdf/%EC%98%81%EC%83%81%EC%B2%98%EB%A6%AC_HW3_18010697%EA%B9%80%ED%95%B4%EB%A6%AC.pdf)|[1](https://github.com/khodid/2020ImageProcessing/blob/main/HW_source/HW3_1.m), [2](https://github.com/khodid/2020ImageProcessing/blob/main/HW_source/HW3_2.m), [3](https://github.com/khodid/2020ImageProcessing/blob/main/HW_source/HW3_3.m), [4](https://github.com/khodid/2020ImageProcessing/blob/main/HW_source/HW3_4.m)|해상도 조정, Dithering 실습|
|4|[여기](https://github.com/khodid/2020ImageProcessing/blob/main/pdf/%EC%98%81%EC%83%81%EC%B2%98%EB%A6%AC_HW4_18010697%EA%B9%80%ED%95%B4%EB%A6%AC.pdf)|[1](https://github.com/khodid/2020ImageProcessing/blob/main/HW_source/HW4_1.m), [2, 3](https://github.com/khodid/2020ImageProcessing/blob/main/HW_source/HW4_23.m), [4](https://github.com/khodid/2020ImageProcessing/blob/main/HW_source/HW4_4.m)|Dithering Matrix 실습, 화소 단위 산술 연산, 히스토그램 스트레칭|
|5|[여기](https://github.com/khodid/2020ImageProcessing/blob/main/pdf/%EC%98%81%EC%83%81%EC%B2%98%EB%A6%AC_HW5_18010697%EA%B9%80%ED%95%B4%EB%A6%AC.pdf)|[1](https://github.com/khodid/2020ImageProcessing/blob/main/HW_source/HW5_1.m), [2](https://github.com/khodid/2020ImageProcessing/blob/main/HW_source/HW5_2.m), [3](https://github.com/khodid/2020ImageProcessing/blob/main/HW_source/HW5_3.m), [4](https://github.com/khodid/2020ImageProcessing/blob/main/HW_source/HW5_4.m)|히스토그램 평활화, 룩업 테이블(LUT), 평균 필터, 분리가능 필터|
|6|[여기](https://github.com/khodid/2020ImageProcessing/blob/main/pdf/%EC%98%81%EC%83%81%EC%B2%98%EB%A6%AC_HW6_18010697%EA%B9%80%ED%95%B4%EB%A6%AC.pdf)|[1](https://github.com/khodid/2020ImageProcessing/blob/main/HW_source/HW6_1.m), [2](https://github.com/khodid/2020ImageProcessing/blob/main/HW_source/HW6_2.m), [3](https://github.com/khodid/2020ImageProcessing/blob/main/HW_source/HW6_3.m), [4](https://github.com/khodid/2020ImageProcessing/blob/main/HW_source/HW6_4.m)|주파수 필터링|

## 2. 최종 프로젝트
- 그간 배운 여러 처리 기법을 MATLAB 내장함수(산술 연산 관련 함수 제외)를 사용하지 않고 구현하기
- 코드 1~2줄 당 주석 하나 씩 달아야 했음

|No.|소스 코드|내용|
|:---:|:---:|:---|
|1|[average_filtering.m](https://github.com/khodid/2020ImageProcessing/blob/main/final/average_filtering.m)|9x9 평균 필터 구현하기|
|2|[histogram_equalization.m](https://github.com/khodid/2020ImageProcessing/blob/main/final/histogram_equalization.m)|히스토그램 평활화 - 명도가 골고루 나타나도록|
|3|[image_resizing.m](https://github.com/khodid/2020ImageProcessing/blob/main/final/image_resizing.m)|이미지 크기 변경(이차 선형 보간법)|
|4|[image_rotation.m](https://github.com/khodid/2020ImageProcessing/blob/main/final/image_rotation.m)|이미지 회전(nearest 보간법)|

\* \'3번: 이미지 크기 변경\'의 경우 보간법에 문제가 있어 감점을 받았는데 사실 아직 어떤 점이 문제였는지 잘 모르겠다.
