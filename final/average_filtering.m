function output_image = average_filtering(input_image)

% �Է� ������ ũ�⸦ �˾Ƴ� (H:����, W:�ʺ�)
[H W] = size(input_image);

% �Է� ������ double������ ������
input_image = double(input_image);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% �� �κп� �ڵ带 �ۼ��ϼ���.
%

% output image�� ũ�⸦ ���մϴ�. ���� ���� ����̹Ƿ� ����, ���ΰ� (kernel����-1)��ŭ ª�����ϴ�.
output_image = zeros(H-8, W-8);
% 9x9 ��� ���͸� �������ݴϴ�. ��� ���Ұ� 1/81�� 
f = ones(9, 9)/81;

% input image�� ��ü ��� ���� ���鼭 ������ �����մϴ�.
% ���� ũ�Ⱑ 9x9�̰�, ������ (1,1)�� input �̹����� (1,1)���� (H-8, W-8)�� ������ ���Դϴ�.
for row = 1:H-8
    for col = 1:W-8
        % output image�� (row, column) ��ġ�� input image�� (row, column)����
        % (row+8, column+8) ��ġ���� 9x9 �簢�� ������ ��� ���Ϳ� ���Һ� ������ �� �� �� ���ϰ�, 
        % �̸� �ݿø��� �����մϴ�.
        output_image(row, col) = round(sum(sum(input_image(row:row+8,col:col+8).*f)));
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% �Է� ������ uint8������ ������
output_image = uint8(output_image);