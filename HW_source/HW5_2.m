% HW5_2

% 2. newborn.tif 영상에 대해 아래의 문제를 해결하세요.
im = imread("sample_images/newborn.tif");
% (1) 강의자료 28쪽에 제시된 piece-wise linear 함수에 대한 LUT인 T를 생성하세요.
t1 = 0.667 * [0:96];
t2 = 2*[97:160] - 128;
t3 = 0.6632 * [161:255] + 85.8947;
T = uint8(floor([t1 t2 t3]));

% (2) newborn 영상에 (1)의 LUT인 T를 적용하여 histogram stretching을 수행한 후 디스플레이하세요.
im_withT = T(im + 1);
figure(1), imshow([im im_withT]); title("2-(2)");

% (3) 강의자료 28쪽에 제시된 piece-wise linear 함수의 역함수에 대한 LUT인 T2를 생성하세요.
% T의 꺾이는 점: (0, 0), (96, 64), (160, 192), (255, 255)
t1 = ((96 - 0)/(64 - 0)) * [0:64];
t2 = ((160 - 96)/(192 - 64)) * [1:128] + 96;   % [1:128] = [65:192]-64
t3 = ((255 - 160)/(255 - 192)) * [1:63] + 160; % [1:63]  = [193:255] - 192
T2 = uint8(floor([t1 t2 t3]));
% (4) (2)의 결과에 (3)의 LUT인 T2를 적용하여 histogram stretching을 수행한 후 디스플레이하세요.
% (5) 원본 영상과 (4)의 결과를 비교하여 두 결과가 거의 유사함을 확인하세요.
im_withT2 = T2(im_withT + 1);
figure(2), imshow([im im_withT2]); title("2-(4),(5)");

% (6) LUT를 사용하면 얻을 수 있는 장점에 대해 두 줄 이상으로 설명하세요