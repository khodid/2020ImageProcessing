% 영상처리 과제 #3  18010697 김해리
% 문제 4 : 본인이 직접 촬영한 영상으로 다음의 내용을 수행하여 보세요.

% (1) 2x2 디더링 매트릭스를 사용하여 디더링을 수행한 결과를 디스플레이하세요.
D2 = [0 128 ;192 64];
D2 = repmat(D2, 128, 128); % 256 / 2 = 128
dither2 = c > D2; 
figure, imshow(dither2); title("2x2 dithering");
% (2) 4x4 디더링 매트릭스를 사용하여 디더링을 수행한 결과를 디스플레이하세요.
D4 = [0 128 32 160;192 64 224 96;48 176 16 144; 240 112 208 80];
D4 = repmat(D4, 64, 64); % 256 / 4 = 64
dither4 = c > D4; 
figure, imshow(dither4); title("4x4 dithering");
% (3) Matlab에서 제공하는 dither 함수를 사용하여 디더링을 수행한 결과를 디스플레이하세요.
figure, imshow(dither(c)); title("dither(c)");