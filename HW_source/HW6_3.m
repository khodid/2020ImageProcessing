clear all
clc

% 3. ��newborn.tif�� ���� ���� �Ʒ��� �Ʒ��� ������ �ذ��ϼ���.
img = imread("sample_images/newborn.tif");

% (1) nlfilter �Լ��� ����Ͽ� ���� 5x5 �ּҰ� ���͸� �����ϰ� ����� ���÷��� �� ��, ������ ��ü����
% ��Ⱑ ��� ���ϴ����� �� ������ �����ϼ���. (�����ڷ� 36~38��)
min_img = nlfilter(img, [5, 5], 'min(x(:))');
figure(1), imshow(min_img);
title("3 - (1) minimum");

% (2) ordfilt2 �Լ��� ����Ͽ� ���� 5x5 �ִ밪 ���͸� �����ϰ� ����� ���÷��� �� ��, ������ ��ü����
% ��Ⱑ ��� ���ϴ����� �� ������ �����ϼ���. (�����ڷ� 36~38��)
max_img = ordfilt2(img,  25, ones(5,5));
figure(2), imshow(max_img);
title("3 - (2) maximum");

% (3) ordfilt2 �Լ��� ����Ͽ� ���� 5x5 Median filter �����ϼ���. (�����ڷ� 36~38��)
med_img = ordfilt2(img, 13, ones(5,5));
figure(3), imshow(med_img);
title("3 - (3) median");


