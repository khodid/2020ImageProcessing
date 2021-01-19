clear all
clc

% 1. ‘pelicans.tif’ 영상에 대해 아래에 아래의 문제를 해결하세요.
img = imread("sample_images/pelicans.tif");

% (1) fspecial 함수를 사용하여 LoG 필터를 생성하여 pelicans 영상을 필터링하세요.
kernel = fspecial("log");
f_img = filter2(kernel, img);

% (2) (1)의 결과에서 0보다 작은 값은 0으로 255보다 큰 값은 255로 만들어 디스플레이하세요.
cut_img = f_img;                        % 필터링한 이미지 복사
cut_img(cut_img < 0) = 0;               % 0보다 작은 값은 0으로 맞추기
cut_img(cut_img > 255) = 255;           % 255보다 큰 값은 255로 맞추기
figure(1), imshow(cut_img);             % 디스플레이 
title("1- (2)");

% (3) (1)의 결과에서 최소값을 0으로 최대값을 1로 스케일링 변환하여 디스플레이하세요.
scale_img = double(f_img);                      % 필터링한 이미지 복사
mx = max(max(scale_img));                       % 최대값 구하기
mn = min(min(scale_img));                       % 최소값 구하기
scale_img = (scale_img - mn) / (mx - mn);       % 0-1 사이 값으로 맞춰주기 위해 최소값 빼주고 전체 스케일로 나눔
figure(2), imshow(scale_img);
title("1 - (3)");

% (4) (1)의 결과에서 절대값이 100보다 큰 값을 1로 작거나 같은 값을 0으로 변환 후 결과 디스플레이하세요.
bin_img = zeros(size(f_img));
bin_img(abs(f_img) > 100) = 1.;
bin_img(abs(f_img) <= 100) = 0.;
figure(3),imshow(bin_img);
title("1 - (4)");