% HW5_4

% 4. wombats.tif ���� ������ ���͸� �����ϼ���. (filter2 �Լ� ���)
im = imread("sample_images/wombats.tif");
f = [1 2 1; 2 4 2; 1 2 1]/16;
% (1) ���� 3x3 ���͸� 3x1 ���Ϳ� 1x3 ���ͷ� �и��ϼ���. (�����ڷ� 17��)
fv = [1; 2; 1]/4; % f == fv * fv'
% (2) (1)�� �и����� ���͸� wombats ���� �����ϼ���. (�����ڷ� 18��)
fv_im = filter2(fv', filter2(fv, im));  fv_im = uint8(fv_im);
% (3) ���� 3x3 ����(f)�� �״�� wombats ���� �����ϼ���.
f_im = filter2(f, im);                  f_im = uint8(f_im);
% (4) (2)�� (3)�� ����� ���÷����Ͽ� �� ����� �������� Ȯ���ϼ���.
figure(1), imshow([fv_im f_im]); title("4-(4)");
% (5) (2)�� (3)�� ��Ⱚ ���̸� ����Ͽ� �� ����� �������� Ȯ���ϼ���.
sum(abs(double(fv_im(:))-double(f_im(:)))) % a�� (2)�� ��� b�� (3)�� ���