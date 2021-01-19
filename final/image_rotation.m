function output_image = image_rotation(input_image, c)

% �Է� ������ ũ�⸦ �˾Ƴ� (H:����, W:�ʺ�)
[H W] = size(input_image);

% �Է� ������ double������ ������
input_image = double(input_image);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ȸ�� ��ȯ ����� ���� �Ӵϴ�.
m = [cosd(c), sind(c); -sind(c), cosd(c)];

% ��� ������ ũ�⸦ ���ϱ� ���� �� �������� ��� ��ġ�ϴ��� ���ϰڽ��ϴ�.
% [ȸ���� x��ǥ ; ȸ���� y��ǥ] = [��ȯ ����� �����] * [���� x��ǥ; ���� y��ǥ]
% (1, 1), (1, W), (H, 1), (H, W) �� �� ���� ȸ���� ��ǥ�� ����մϴ�
points = inv(m)*[1 1 H H; 1 W 1 W];
% ��, �� ��ǥ�� �ִ밪�� ���ϰ�, �׿� ����� ���� �� ū ���� �����ɴϴ�.
indmax = ceil(max(points'));
% ��, �� ��ǥ�� �ּҰ��� ���ϰ�, �׿� ����� ���� �� ���� ���� �����ɴϴ�.
indmin = floor(min(points'));
% ȸ���� ������ �� ���� �� �ִ� �ʺ�� ���̸� ���մϴ�.
nH = indmax(1) - indmin(1);
nW = indmax(2) - indmin(2);
% �ռ� ���� �ʺ�� ���̸� �̿��� output ������ �� ������ �����մϴ�.
output_image = zeros(nH, nW);

% output image�� �� �ȼ��� ���� ����մϴ�.
for row = 1:nH
    for col = 1:nW
        % ��ȯ ����� �̿��� ȸ���� (row,col) ��ġ�� �ٽ� ������� ������ ���� ��ġ�� ���մϴ�.
        index = m*[row + indmin(1) ; col + indmin(2)];
        % ���� ��ġ�� ���� ������ ������ ����ٸ�
        if or(or(index(1)<1, index(1)>H),or(index(2)<1, index(2)>W))
            % �� �������� 0(����)�� ä��ϴ�.
            output_image(row, col) = 0;
        % ���� ��ġ�� ���� ������ ������ ����� �ʴ´ٸ�
        else
            % ���� ���� �ݿø��� ���� ����� �ȼ��� ��ǥ�� ���ϰ�(�ֱ�������), �ش� �ȼ��� ����
            % output ������ (row, col) ��ġ�� �����մϴ�.
            output_image(row, col) = input_image(round(index(1)), round(index(2)));
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% �Է� ������ uint8������ ������
output_image = uint8(output_image);