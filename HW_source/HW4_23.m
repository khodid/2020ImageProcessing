im = imread("sample_images/newborn.tif");

% 2. 
% �����ڷḦ �����Ͽ�, newborn.tif ���� ���� 
% ���õ� ������ �ذ��ϼ���.

% (1) ��� ȭ���� ��� ���� 2�� ������ 100�� ���� ������ �����ϰ� ���÷����ϼ���.
imA = imadd(imdivide(im, 2), 100);
figure(1), imshow([im, imA]); title("2-(1)");
% (2) 1���� ��Ⱚ�� ��� ��ȭ�Ǵ����� �Ʒ� �ڵ带 ����� Ȯ���ϼ���.
figure(2); plot(im(:), imA(:), '.'); axis equal; axis([0 255 0 255]); % a�� ������, b�� ��Ⱚ�� ����� ����
title("2-(2)");
% (3) ��� ȭ���� ��Ⱚ���� 50�� ����, 2�� ���� ������ �����ϰ� ���÷����ϼ���.
imB = immultiply(imsubtract(im, 50), 2);
figure(3), imshow([im, imB]); title("2-(3)");
% (4) (3)���� ��Ⱚ�� ��� ��ȭ�Ǵ°��� �Ʒ��� �ڵ带 ����� Ȯ���ϼ���.
figure(4); plot(im(:), imB(:), '.'); axis equal; axis([0 255 0 255]);
title("2-(4)");

% ============================================================================================
% 3.
% newborn.tif ���� ���� �Ʒ��� ������ �ذ��ϼ���.

% (1) �ռ� 2-(1) �� ����� ȹ��� ���� b�� histogram�� �׷�������.
figure(5), imhist(imA); axis tight; title("3-(1) Hist");

% (2) Histogram�� ����, �ش� ���� ���Ե� ȭ�ҵ��� ��Ⱚ�� 100~228 ���̿� �������� Ȯ���� �� �ִµ�,
% imadjust(im, [x y], [z w]);�� ����Ͽ� 
% 100~228 ������ ��Ⱚ�� 0~255 ������ ��Ⱚ���� ������ ��� ����� histogram�� ���÷����ϼ���.
imA_adj = imadjust(im, [100/255, 228/255], [0, 1]);
figure(6), 
subplot(1,2,1); imhist(imA_adj); axis tight;
subplot(1,2,2); imshow(imA_adj);
title("3-(2)");

% (3) newborn.tif ������ �о histogram�� �׷�������. (4�� �����ڷ� 10�� ����)
figure(7), imhist(im); title("3-(3)");
% (4) Histogram�� ����, �ش� ������ ��Ⱚ 220~250 ���̿� ���� ȭ�ҵ��� �������� Ȯ���� �� �ִµ�,
% imadjust(im, [0 1], [0 1], gamma);�� ����Ͽ� histogram���� ��ο� ���� ���̰�(shrinking), ���� ���� ��
% ������(stretching) �ϴ� ��쿡 ���� ������ gamma ���� ã��, �̸� �����Ͽ� ��� ������ histogram�� ���÷����ϼ���.
im_adj = imadjust(im, [0, 1], [0, 1], 2); % ���ϴ� ó���� ���ؼ� gamma�� 1���� Ŀ�� ��
figure(8), 
subplot(1,2,1); imhist(im_adj); axis tight;
subplot(1,2,2); imshow(im_adj); axis tight;
title("3-(4)");