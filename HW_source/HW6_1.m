clear all
clc

% 1. ��pelicans.tif�� ���� ���� �Ʒ��� �Ʒ��� ������ �ذ��ϼ���.
img = imread("sample_images/pelicans.tif");

% (1) fspecial �Լ��� ����Ͽ� LoG ���͸� �����Ͽ� pelicans ������ ���͸��ϼ���.
kernel = fspecial("log");
f_img = filter2(kernel, img);

% (2) (1)�� ������� 0���� ���� ���� 0���� 255���� ū ���� 255�� ����� ���÷����ϼ���.
cut_img = f_img;                        % ���͸��� �̹��� ����
cut_img(cut_img < 0) = 0;               % 0���� ���� ���� 0���� ���߱�
cut_img(cut_img > 255) = 255;           % 255���� ū ���� 255�� ���߱�
figure(1), imshow(cut_img);             % ���÷��� 
title("1- (2)");

% (3) (1)�� ������� �ּҰ��� 0���� �ִ밪�� 1�� �����ϸ� ��ȯ�Ͽ� ���÷����ϼ���.
scale_img = double(f_img);                      % ���͸��� �̹��� ����
mx = max(max(scale_img));                       % �ִ밪 ���ϱ�
mn = min(min(scale_img));                       % �ּҰ� ���ϱ�
scale_img = (scale_img - mn) / (mx - mn);       % 0-1 ���� ������ �����ֱ� ���� �ּҰ� ���ְ� ��ü �����Ϸ� ����
figure(2), imshow(scale_img);
title("1 - (3)");

% (4) (1)�� ������� ���밪�� 100���� ū ���� 1�� �۰ų� ���� ���� 0���� ��ȯ �� ��� ���÷����ϼ���.
bin_img = zeros(size(f_img));
bin_img(abs(f_img) > 100) = 1.;
bin_img(abs(f_img) <= 100) = 0.;
figure(3),imshow(bin_img);
title("1 - (4)");