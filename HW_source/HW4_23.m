im = imread("sample_images/newborn.tif");

% 2. 
% 강의자료를 참조하여, newborn.tif 영상에 대해 
% 제시된 문제를 해결하세요.

% (1) 모든 화소의 밝기 값을 2로 나누고 100을 더한 영상을 생성하고 디스플레이하세요.
imA = imadd(imdivide(im, 2), 100);
figure(1), imshow([im, imA]); title("2-(1)");
% (2) 1에서 밝기값이 어떻게 변화되는지를 아래 코드를 사용해 확인하세요.
figure(2); plot(im(:), imA(:), '.'); axis equal; axis([0 255 0 255]); % a는 원영상, b는 밝기값이 변경된 영상
title("2-(2)");
% (3) 모든 화소의 밝기값에서 50을 빼고, 2를 곱한 영상을 생성하고 디스플레이하세요.
imB = immultiply(imsubtract(im, 50), 2);
figure(3), imshow([im, imB]); title("2-(3)");
% (4) (3)에서 밝기값이 어떻게 변화되는가를 아래의 코드를 사용해 확인하세요.
figure(4); plot(im(:), imB(:), '.'); axis equal; axis([0 255 0 255]);
title("2-(4)");

% ============================================================================================
% 3.
% newborn.tif 영상에 대해 아래의 문제를 해결하세요.

% (1) 앞선 2-(1) 의 결과로 획득된 영상 b의 histogram을 그려보세요.
figure(5), imhist(imA); axis tight; title("3-(1) Hist");

% (2) Histogram을 보면, 해당 영상에 포함된 화소들의 밝기값이 100~228 사이에 존재함을 확인할 수 있는데,
% imadjust(im, [x y], [z w]);를 사용하여 
% 100~228 사이의 밝기값을 0~255 사이의 밝기값으로 변경한 결과 영상과 histogram을 디스플레이하세요.
imA_adj = imadjust(im, [100/255, 228/255], [0, 1]);
figure(6), 
subplot(1,2,1); imhist(imA_adj); axis tight;
subplot(1,2,2); imshow(imA_adj);
title("3-(2)");

% (3) newborn.tif 영상을 읽어서 histogram을 그려보세요. (4장 강의자료 10쪽 참조)
figure(7), imhist(im); title("3-(3)");
% (4) Histogram을 보면, 해당 영상은 밝기값 220~250 사이에 많은 화소들이 존재함을 확인할 수 있는데,
% imadjust(im, [0 1], [0 1], gamma);를 사용하여 histogram에서 어두운 쪽은 줄이고(shrinking), 밝은 쪽은 늘
% 리려고(stretching) 하는 경우에 대해 적절한 gamma 값을 찾고, 이를 실행하여 결과 영상의 histogram을 디스플레이하세요.
im_adj = imadjust(im, [0, 1], [0, 1], 2); % 원하는 처리를 위해선 gamma가 1보다 커야 함
figure(8), 
subplot(1,2,1); imhist(im_adj); axis tight;
subplot(1,2,2); imshow(im_adj); axis tight;
title("3-(4)");