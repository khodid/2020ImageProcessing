% 5_3

% 3. caribou.tif ���� 5x5 ��� ���͸� �����ϼ���. (filter2 �Լ� ���)
im = imread("sample_images/caribou.tif");
f = ones(5, 5)/25;
% (1) ���� ���� ������� ������ �� ����� ���÷����ϼ���.
im_1 = filter2(f, im, 'valid');
% (2) ������ ä��(zero-padding) ������� ������ �� ����� ���÷����ϼ���.
im_2 = filter2(f, im, 'same');
% (3) �̷���(mirroring) ������� ������ �� ����� ���÷����ϼ���.
m_im = [im(1:2, :) ; im ; im(end-1:end, :)]; % ��ĭ�� �̷���
m_im = [m_im(:, 1:2) m_im m_im(:, end-1:end)]; % ��ĭ�� �̷���
im_3 = filter2(f, m_im, 'valid');

figure(1), imshow(im); title("���� ����");
figure(2), imshow(uint8(im_1)); title("3-(2) valid");
figure(3), imshow(uint8(im_2)); title("3-(3) zero padding");
figure(4), imshow(uint8(im_3)); title("3-(4) mirroring");
