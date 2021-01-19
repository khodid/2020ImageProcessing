% 4. histpwl �Լ��� ���� �Ʒ��� ������ �ذ��ϼ���.
% (1) histpwl �Լ��� �ۼ��Ͽ� histpwl.m ���Ϸ� �����ϼ���.
% 

% (2) tire.tif ������ t�� �о histpwl �Լ��� ������ ��, 
% ��� ���� th1�� ���÷����ϼ���.
t = imread("sample_images/tire.tif");
th1=histpwl(t, [0 0.3 0.8 1.0], [0 0.6 0.7 1.0]);

% (3) histpwl �Լ��� ����Ͽ� (2)�� ����� th1�� �������� t�� �����ϰ� �������Ϸ��� �մϴ�.
% v1�� v2�� �����ϰ� �����ϰ� �̸� ������ �� th2�� t�� ���÷����Ͽ� �� ������ �������� Ȯ���ϼ���.

% sol: 
%       (0, 0), (0.3, 0.6), (0.8, 0.7), (1, 1)
%       x, y ��ǥ �ٲ��ָ� �˴ϴ�.
v1 = [0 0.6 0.7 1];
v2 = [0 0.3 0.8 1];
th2=histpwl(th1, v1, v2);
figure, imshow([t th2]);

figure, subplot(1, 2, 1); imhist(t); title("t�� histogram");
subplot(1, 2, 2); imhist(th2); title("th2�� histogram");
