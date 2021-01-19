clear all
clc

% 4. ‘caribou.tif’ 영상에 대해 아래에 아래의 문제를 해결하세요.
img = imread("sample_images/caribou.tif");

% (1) 이상적인 저역통과 필터링을 주파수 영역에서 수행하세요. 디스플레이할 내용은 다음과 같습니다: 원본
% 영상, 필터, 주파수 도메인에서의 필터링 결과, 영상 도메인에서의 필터링 결과 (강의자료 47~49쪽)
% [x, y] = meshgrid(-128:127, -128:127);
% z = sqrt(x.^2 + y.^2);
% c = (z<15);
% cf = fftshift(fft2(img));
% cfl = cf.*c;
% cfli = ifft2(cfl);
% 
% figure(1); imshow(img);
% figure(2); imshow(c);
% figure(3); fftshow(cfl,'log');
% figure(4); fftshow(cfli,'abs');

% (2) 이상적인 고역통과 필터링을 주파수 영역에서 수행하세요. 디스플레이할 내용은 다음과 같습니다: 원본
% 영상, 필터, 주파수 도메인에서의 필터링 결과, 영상 도메인에서의 필터링 결과 (강의자료 50~52쪽)
% [x, y] = meshgrid(-128:127, -128:127);
% z = sqrt(x.^2 + y.^2);
% c = (z>15);
% cf = fftshift(fft2(img));
% cfh = cf.*c;
% cfhi = ifft2(cfh);
% 
% figure(1); imshow(img);
% figure(2); imshow(c);
% figure(3); fftshow(cfh,'log');
% figure(4); fftshow(cfhi,'abs');

% (3) 가우시안 저역통과 필터링을 주파수 영역에서 수행하세요. 디스플레이할 내용은 다음과 같습니다: 원본
% 영상, 필터, 주파수 도메인에서의 필터링 결과, 영상 도메인에서의 필터링 결과 (강의자료 62~63쪽)
% - 가우시안 필터의 최대값을 1로 만들어 주기 위해 fspecial로 필터 g를 만들고 g=g/max(g(:))를 해주세요.

g = fspecial('gaussian', 256, 10);
g = g/max(g(:));
cf=fftshift(fft2(img));
cfg=cf.*g;
cfgi = ifft2(cfg);

figure(1); imshow(img);
figure(2); imshow(g);
figure(3); fftshow(cfg,'log');
figure(4); fftshow(cfgi,'abs');

% (4) 가우시안 고역통과 필터링을 주파수 영역에서 수행하세요. 디스플레이할 내용은 다음과 같습니다: 원본
% 영상, 필터, 주파수 도메인에서의 필터링 결과, 영상 도메인에서의 필터링 결과 (강의자료 65쪽)
% - 가우시안 필터의 최대값을 1로 만들어 주기 위해 fspecial로 필터 g를 만들고 g=g/max(g(:))를 해주세요.

g = fspecial('gaussian', 256, 30);
g = 1 - g/max(g(:));
cf=fftshift(fft2(img));
cfg=cf.*g;
cfgi = ifft2(cfg);

figure(1); imshow(img);
figure(2); imshow(g);
figure(3); fftshow(cfg,'log');
figure(4); fftshow(cfgi,'abs');

% (5) 저역통과 필터링과 고역통과 필터링의 효과에 대해 각각 한 줄 이상으로 설명하세요.