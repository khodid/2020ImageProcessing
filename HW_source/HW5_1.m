% HW5_1

% 1. pelicans.tif 영상에 대해 아래에 아래의 문제를 해결하세요.
a = imread("sample_images/pelicans.tif");
%(1) 원본 영상 a에 imdivide 함수를 적용하여 contrast가 좋지 않은 영상 b를 만드세요. (강의자료 25쪽)
b = imdivide(a, 3);
%(2) b에 histogram equalization을 적용하여 결과 영상 c를 만드세요.
c = histeq(b);
%(3) b와 c를 디스플레이하고, b와 c의 histogram을 디스플레이하여 contrast가 좋아진 결과를 영상과
% histogram을 통해 확인하세요.
figure(1), imshow([b c]); title("1-(3) image");
figure(2), title("1-(3) hist");
subplot(1, 2, 1); imhist(b); axis tight; title("before histeq");
subplot(1, 2, 2); imhist(c); axis tight; title("after histeq");
%(4) b와 c의 histogram에 대한 누적합을 그려보세요.
[by bx] = imhist(b); % 영상 b에 대해 x는 0~255의 밝기값이고, y는 각 밝기값을 가지는 화소의 개수
[cy cx] = imhist(c);
figure(3), 
plot(bx, cumsum(by),'r', cx, cumsum(cy), 'b'); 
legend("b의 누적합", "c의 누적합");
title("1-(4) 누적합");