% 4. histpwl 함수에 대해 아래의 문제를 해결하세요.
% (1) histpwl 함수를 작성하여 histpwl.m 파일로 저장하세요.
% 

% (2) tire.tif 영상을 t로 읽어서 histpwl 함수를 실행한 후, 
% 결과 영상 th1을 디스플레이하세요.
t = imread("sample_images/tire.tif");
th1=histpwl(t, [0 0.3 0.8 1.0], [0 0.6 0.7 1.0]);

% (3) histpwl 함수를 사용하여 (2)번 결과인 th1을 원영상인 t와 유사하게 역변경하려고 합니다.
% v1과 v2를 적절하게 선택하고 이를 실행한 후 th2와 t를 디스플레이하여 두 영상이 유사한지 확인하세요.

% sol: 
%       (0, 0), (0.3, 0.6), (0.8, 0.7), (1, 1)
%       x, y 좌표 바꿔주면 됩니다.
v1 = [0 0.6 0.7 1];
v2 = [0 0.3 0.8 1];
th2=histpwl(th1, v1, v2);
figure, imshow([t th2]);

figure, subplot(1, 2, 1); imhist(t); title("t의 histogram");
subplot(1, 2, 2); imhist(th2); title("th2의 histogram");
