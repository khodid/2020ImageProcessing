% ����ó�� ���� #3  18010697 ���ظ�
% ���� 3 : ������ ���� �Կ��� �������� ������ ������ �����Ͽ� ������.
figure, imshow(c); title('����');
% (1) �����ػ󵵸� 2, 4, 8, 16�� �ٿ��� ���÷��� �ϼ���.
block2 = imresize(imresize(c, 1/2, 'nearest'), 2, 'nearest');
block4 = imresize(imresize(c, 1/4, 'nearest'), 4, 'nearest');
block8 = imresize(imresize(c, 1/8, 'nearest'), 8, 'nearest');
block16 = imresize(imresize(c, 1/16, 'nearest'), 16, 'nearest');
figure,
subplot(2, 2, 1); imshow(block2); title('2��');
subplot(2, 2, 2), imshow(block4); title('4��');
subplot(2, 2, 3), imshow(block8); title('8��');
subplot(2, 2, 4), imshow(block16); title('16��');
% (2) ��� ���� 2, 8, 32, 128 �ܰ�� ���� ����ȭ�Ͽ� ���÷����ϼ���.
figure,
subplot(2, 2, 1); imshow(grayslice(c, 2), gray(2)); title('2�ܰ�');
subplot(2, 2, 2), imshow(grayslice(c, 8), gray(8)); title('8�ܰ�');
subplot(2, 2, 3), imshow(grayslice(c, 32), gray(32)); title('32�ܰ�');
subplot(2, 2, 4), imshow(grayslice(c, 128), gray(128)); title('128�ܰ�');
