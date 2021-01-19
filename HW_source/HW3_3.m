% 영상처리 과제 #3  18010697 김해리
% 문제 3 : 본인이 직접 촬영한 영상으로 다음의 내용을 수행하여 보세요.
figure, imshow(c); title('원본');
% (1) 공간해상도를 2, 4, 8, 16배 줄여서 디스플레이 하세요.
block2 = imresize(imresize(c, 1/2, 'nearest'), 2, 'nearest');
block4 = imresize(imresize(c, 1/4, 'nearest'), 4, 'nearest');
block8 = imresize(imresize(c, 1/8, 'nearest'), 8, 'nearest');
block16 = imresize(imresize(c, 1/16, 'nearest'), 16, 'nearest');
figure,
subplot(2, 2, 1); imshow(block2); title('2배');
subplot(2, 2, 2), imshow(block4); title('4배');
subplot(2, 2, 3), imshow(block8); title('8배');
subplot(2, 2, 4), imshow(block16); title('16배');
% (2) 밝기 값을 2, 8, 32, 128 단계로 균일 양자화하여 디스플레이하세요.
figure,
subplot(2, 2, 1); imshow(grayslice(c, 2), gray(2)); title('2단계');
subplot(2, 2, 2), imshow(grayslice(c, 8), gray(8)); title('8단계');
subplot(2, 2, 3), imshow(grayslice(c, 32), gray(32)); title('32단계');
subplot(2, 2, 4), imshow(grayslice(c, 128), gray(128)); title('128단계');
