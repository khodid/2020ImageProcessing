clear all
clc

% 2. ‘caribou.tif’ 영상에 대해 아래에 아래의 문제를 해결하세요.
img = imread("sample_images/caribou.tif");

% (1) fspecial 함수를 사용하여 크기가 5x5이고 표준편차가 2인 가우시안 필터를 만들고, 
% 이 필터를 사용하여 caribou 영상을 필터링하세요.
kernel = fspecial("gaussian", [5 5], 2);   % h = fspecial('gaussian',hsize,sigma)
blur_img = filter2(kernel, img);

% (2) (1)의 결과를 low-pass filtering 결과로 사용하여 caribou.tif 영상에 대한 언샤프 마스킹을 수행하고, 결과
% 를 디스플레이하세요. (scale은 1.5를 사용하고, 결과를 xu라고 할 때, uint8(xu*3)으로 디스플레이하세요.)
unsharp_img1 = double(img) - blur_img/1.5;
figure(1), imshow(uint8(unsharp_img1 * 3));
title("2 - (2): unsharped with scale 1.5");

% (3) 언샤프 마스킹의 scale를 1.1과 10으로 변경해서 결과의 변화를 관찰하세요.
% (강의자료 31쪽에서 xf/1.1와 xf/10로 설정하라는 의미입니다. 여기에서 산출된 결과를 각각 xu1, xu2라고
% 할 때, 각각을 uint8(xu1*8), uint8(xu2)으로 디스플레이하세요.)
unsharp_img2 = double(img) - blur_img/1.1;
unsharp_img3 = double(img) - blur_img/10;
figure(2), imshow([uint8(unsharp_img2 * 8), uint8(unsharp_img3)]);
title("2 - (3): unsharped with scale 1.1(left), 10(right)");

% (4) Scale을 10, 1.5, 1.1으로 변경할 때의 변화를 에지 강조 측면에서 설명하세요.

