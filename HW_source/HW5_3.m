% 5_3

% 3. caribou.tif 영상에 5x5 평균 필터를 적용하세요. (filter2 함수 사용)
im = imread("sample_images/caribou.tif");
f = ones(5, 5)/25;
% (1) 에지 무시 방식으로 적용한 후 결과를 디스플레이하세요.
im_1 = filter2(f, im, 'valid');
% (2) 영으로 채움(zero-padding) 방식으로 적용한 후 결과를 디스플레이하세요.
im_2 = filter2(f, im, 'same');
% (3) 미러링(mirroring) 방식으로 적용한 후 결과를 디스플레이하세요.
m_im = [im(1:2, :) ; im ; im(end-1:end, :)]; % 두칸씩 미러링
m_im = [m_im(:, 1:2) m_im m_im(:, end-1:end)]; % 두칸씩 미러링
im_3 = filter2(f, m_im, 'valid');

figure(1), imshow(im); title("원본 영상");
figure(2), imshow(uint8(im_1)); title("3-(2) valid");
figure(3), imshow(uint8(im_2)); title("3-(3) zero padding");
figure(4), imshow(uint8(im_3)); title("3-(4) mirroring");
