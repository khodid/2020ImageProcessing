clear all
clc

% 3. ‘newborn.tif’ 영상에 대해 아래에 아래의 문제를 해결하세요.
img = imread("sample_images/newborn.tif");

% (1) nlfilter 함수를 사용하여 영상에 5x5 최소값 필터를 적용하고 결과를 디스플레이 한 후, 영상의 전체적인
% 밝기가 어떻게 변하는지와 그 이유를 설명하세요. (강의자료 36~38쪽)
min_img = nlfilter(img, [5, 5], 'min(x(:))');
figure(1), imshow(min_img);
title("3 - (1) minimum");

% (2) ordfilt2 함수를 사용하여 영상에 5x5 최대값 필터를 적용하고 결과를 디스플레이 한 후, 영상의 전체적인
% 밝기가 어떻게 변하는지와 그 이유를 설명하세요. (강의자료 36~38쪽)
max_img = ordfilt2(img,  25, ones(5,5));
figure(2), imshow(max_img);
title("3 - (2) maximum");

% (3) ordfilt2 함수를 사용하여 영상에 5x5 Median filter 적용하세요. (강의자료 36~38쪽)
med_img = ordfilt2(img, 13, ones(5,5));
figure(3), imshow(med_img);
title("3 - (3) median");


