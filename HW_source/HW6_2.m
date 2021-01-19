clear all
clc

% 2. ��caribou.tif�� ���� ���� �Ʒ��� �Ʒ��� ������ �ذ��ϼ���.
img = imread("sample_images/caribou.tif");

% (1) fspecial �Լ��� ����Ͽ� ũ�Ⱑ 5x5�̰� ǥ�������� 2�� ����þ� ���͸� �����, 
% �� ���͸� ����Ͽ� caribou ������ ���͸��ϼ���.
kernel = fspecial("gaussian", [5 5], 2);   % h = fspecial('gaussian',hsize,sigma)
blur_img = filter2(kernel, img);

% (2) (1)�� ����� low-pass filtering ����� ����Ͽ� caribou.tif ���� ���� ����� ����ŷ�� �����ϰ�, ���
% �� ���÷����ϼ���. (scale�� 1.5�� ����ϰ�, ����� xu��� �� ��, uint8(xu*3)���� ���÷����ϼ���.)
unsharp_img1 = double(img) - blur_img/1.5;
figure(1), imshow(uint8(unsharp_img1 * 3));
title("2 - (2): unsharped with scale 1.5");

% (3) ����� ����ŷ�� scale�� 1.1�� 10���� �����ؼ� ����� ��ȭ�� �����ϼ���.
% (�����ڷ� 31�ʿ��� xf/1.1�� xf/10�� �����϶�� �ǹ��Դϴ�. ���⿡�� ����� ����� ���� xu1, xu2���
% �� ��, ������ uint8(xu1*8), uint8(xu2)���� ���÷����ϼ���.)
unsharp_img2 = double(img) - blur_img/1.1;
unsharp_img3 = double(img) - blur_img/10;
figure(2), imshow([uint8(unsharp_img2 * 8), uint8(unsharp_img3)]);
title("2 - (3): unsharped with scale 1.1(left), 10(right)");

% (4) Scale�� 10, 1.5, 1.1���� ������ ���� ��ȭ�� ���� ���� ���鿡�� �����ϼ���.

