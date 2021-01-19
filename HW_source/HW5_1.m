% HW5_1

% 1. pelicans.tif ���� ���� �Ʒ��� �Ʒ��� ������ �ذ��ϼ���.
a = imread("sample_images/pelicans.tif");
%(1) ���� ���� a�� imdivide �Լ��� �����Ͽ� contrast�� ���� ���� ���� b�� ���弼��. (�����ڷ� 25��)
b = imdivide(a, 3);
%(2) b�� histogram equalization�� �����Ͽ� ��� ���� c�� ���弼��.
c = histeq(b);
%(3) b�� c�� ���÷����ϰ�, b�� c�� histogram�� ���÷����Ͽ� contrast�� ������ ����� �����
% histogram�� ���� Ȯ���ϼ���.
figure(1), imshow([b c]); title("1-(3) image");
figure(2), title("1-(3) hist");
subplot(1, 2, 1); imhist(b); axis tight; title("before histeq");
subplot(1, 2, 2); imhist(c); axis tight; title("after histeq");
%(4) b�� c�� histogram�� ���� �������� �׷�������.
[by bx] = imhist(b); % ���� b�� ���� x�� 0~255�� ��Ⱚ�̰�, y�� �� ��Ⱚ�� ������ ȭ���� ����
[cy cx] = imhist(c);
figure(3), 
plot(bx, cumsum(by),'r', cx, cumsum(cy), 'b'); 
legend("b�� ������", "c�� ������");
title("1-(4) ������");