function output_image = histogram_equalization(input_image)

% �Է� ������ ũ�⸦ �˾Ƴ� (H:����, W:�ʺ�)
[H W] = size(input_image);

% �Է� ������ double������ ������
input_image = double(input_image);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% num�� ��Ⱚ�� 1~i�� �ȼ����� �����մϴ�. input_image�� uint8���̹Ƿ� ��Ⱚ�� 1~255���� �ֽ��ϴ�.
num = 0;
% �ߺ��� ����� ���̱� ���� �̹����� �� �ȼ� ���� ������ �Ӵϴ�.
n = H*W;
% input size�� �Ȱ��� output image ������ ����ϴ�. 
output_image = zeros(H, W);

% ��Ⱚ 1~255�� ���� �ݺ��մϴ�.
for i = 1:255
    % input image �� ��Ⱑ i�� ���Ҵ� 1, �������� 0���� ä��� logical ����� ����ϴ�.
    temp = (input_image == i);
    % sum�� �̿��� logical True(1) ���� ��� ���� 
    % ��Ⱑ i�� ������ ������ ���ϰ�, 1~(i-1)������ ���� ���� �������� ���մϴ�.
    num = num + sum(sum(temp));
    % ��Ȱȭ ���Ŀ� ���� (�ݿø�((��Ⱚ�� 1~i�� �ȼ���) / (��ü �ȼ���) * (��Ⱚ ���� - 1))) ���
    output_image(temp) = round(num/n*244);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% �Է� ������ uint8������ ������
output_image = uint8(output_image);