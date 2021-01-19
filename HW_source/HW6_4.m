clear all
clc

% 4. ��caribou.tif�� ���� ���� �Ʒ��� �Ʒ��� ������ �ذ��ϼ���.
img = imread("sample_images/caribou.tif");

% (1) �̻����� ������� ���͸��� ���ļ� �������� �����ϼ���. ���÷����� ������ ������ �����ϴ�: ����
% ����, ����, ���ļ� �����ο����� ���͸� ���, ���� �����ο����� ���͸� ��� (�����ڷ� 47~49��)
% [x, y] = meshgrid(-128:127, -128:127);
% z = sqrt(x.^2 + y.^2);
% c = (z<15);
% cf = fftshift(fft2(img));
% cfl = cf.*c;
% cfli = ifft2(cfl);
% 
% figure(1); imshow(img);
% figure(2); imshow(c);
% figure(3); fftshow(cfl,'log');
% figure(4); fftshow(cfli,'abs');

% (2) �̻����� ����� ���͸��� ���ļ� �������� �����ϼ���. ���÷����� ������ ������ �����ϴ�: ����
% ����, ����, ���ļ� �����ο����� ���͸� ���, ���� �����ο����� ���͸� ��� (�����ڷ� 50~52��)
% [x, y] = meshgrid(-128:127, -128:127);
% z = sqrt(x.^2 + y.^2);
% c = (z>15);
% cf = fftshift(fft2(img));
% cfh = cf.*c;
% cfhi = ifft2(cfh);
% 
% figure(1); imshow(img);
% figure(2); imshow(c);
% figure(3); fftshow(cfh,'log');
% figure(4); fftshow(cfhi,'abs');

% (3) ����þ� ������� ���͸��� ���ļ� �������� �����ϼ���. ���÷����� ������ ������ �����ϴ�: ����
% ����, ����, ���ļ� �����ο����� ���͸� ���, ���� �����ο����� ���͸� ��� (�����ڷ� 62~63��)
% - ����þ� ������ �ִ밪�� 1�� ����� �ֱ� ���� fspecial�� ���� g�� ����� g=g/max(g(:))�� ���ּ���.

g = fspecial('gaussian', 256, 10);
g = g/max(g(:));
cf=fftshift(fft2(img));
cfg=cf.*g;
cfgi = ifft2(cfg);

figure(1); imshow(img);
figure(2); imshow(g);
figure(3); fftshow(cfg,'log');
figure(4); fftshow(cfgi,'abs');

% (4) ����þ� ����� ���͸��� ���ļ� �������� �����ϼ���. ���÷����� ������ ������ �����ϴ�: ����
% ����, ����, ���ļ� �����ο����� ���͸� ���, ���� �����ο����� ���͸� ��� (�����ڷ� 65��)
% - ����þ� ������ �ִ밪�� 1�� ����� �ֱ� ���� fspecial�� ���� g�� ����� g=g/max(g(:))�� ���ּ���.

g = fspecial('gaussian', 256, 30);
g = 1 - g/max(g(:));
cf=fftshift(fft2(img));
cfg=cf.*g;
cfgi = ifft2(cfg);

figure(1); imshow(img);
figure(2); imshow(g);
figure(3); fftshow(cfg,'log');
figure(4); fftshow(cfgi,'abs');

% (5) ������� ���͸��� ����� ���͸��� ȿ���� ���� ���� �� �� �̻����� �����ϼ���.