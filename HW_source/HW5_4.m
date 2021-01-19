% HW5_4

% 4. wombats.tif 영상에 다음의 필터를 적용하세요. (filter2 함수 사용)
im = imread("sample_images/wombats.tif");
f = [1 2 1; 2 4 2; 1 2 1]/16;
% (1) 위의 3x3 필터를 3x1 필터와 1x3 필터로 분리하세요. (강의자료 17쪽)
fv = [1; 2; 1]/4; % f == fv * fv'
% (2) (1)의 분리가능 필터를 wombats 영상에 적용하세요. (강의자료 18쪽)
fv_im = filter2(fv', filter2(fv, im));  fv_im = uint8(fv_im);
% (3) 위의 3x3 필터(f)를 그대로 wombats 영상에 적용하세요.
f_im = filter2(f, im);                  f_im = uint8(f_im);
% (4) (2)와 (3)의 결과를 디스플레이하여 두 결과가 동일한지 확인하세요.
figure(1), imshow([fv_im f_im]); title("4-(4)");
% (5) (2)와 (3)의 밝기값 차이를 계산하여 두 결과가 동일한지 확인하세요.
sum(abs(double(fv_im(:))-double(f_im(:)))) % a는 (2)의 결과 b는 (3)의 결과