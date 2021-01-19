% 영상처리 과제 #3 18010697 김해리
% 1번: 본인이 직접 촬영한 영상으로 다음 내용을 수행하여 보세요.

% (1) imread 함수를 사용하여 영상을 읽으세요.
a = imread("yoonji.jpg");

% (2) rgb2gray 함수를 사용해 컬러영상 a를 그레이스케일 영상 b로 변경하세요.
b = rgb2gray(a);

% (3) 그레이스케일 영상 b를 256x256 크기의 영상으로 변경하세요.
c = imresize(b, [256 256]);

% (4) c를 imshow 함수를 사용하여 디스플레이하세요.
figure, imshow(c)

% (5) c를 0~1 사이의 값을 갖는 double형으로 변경한 후 imshow 함수를 사용하여 디스플레이 하세요.
c_d = double(c)/255;
figure, imshow(c_d)