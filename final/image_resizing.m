function output_image = image_resizing(input_image, a, b)

% �Է� ������ ũ�⸦ �˾Ƴ� (H:����, W:�ʺ�)
[H W] = size(input_image);

% �Է� ������ double������ ������
input_image = double(input_image);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% �� �κп� �ڵ带 �ۼ��ϼ���.
%

% scaling�� ��ģ output image�� ���̿� �ʺ� ����մϴ�. ���� �������� ���� ������ �ٲپ� �ݴϴ�.
nH = floor(H*b);
nW = floor(W*a);
% ����� ���� �������� output image�� �� ������ ������ݴϴ�.
output_image = zeros(nH, nW);

% output image�� ��� �ȼ��� ���� �����մϴ�.
for row = 1:nH
    for column = 1:nW
        % (row, column)�� ���� ����(input image)���� ��� ��ġ���� ���մϴ�.
        % output_img���� ������ �ȼ��� �ε����� x, �ش� �ȼ��� input_img������ ��ġ�� y��� �Ѵٸ�
        % (y - 1) = (��ȯ �� ����-1)/(��ȯ �� ����-1)*(x - 1)  --> �׷����� ���� �˾Ƴ�
        % ��: a = 2�� �� input = [1,2,3]�̶�� : output index=[1, 2, 3, 4, 5, 6] -> [1, 1.4, 1.8, 2.2, 2.6, 3]
        r =  1 + (H-1)/(nH-1)*(row-1);
        c =  1 + (W-1)/(nW-1)*(column -1);
        % �ش� ��ġ�� ���� ����� 4�� �ȼ� �� ��, �� �ε����� ���� �� �ε����� ���մϴ�.
        r_pivot = floor(r);
        c_pivot = floor(c);
        
        % �ش� ��ġ�� 4�� �� ��� � ������ ��ġ�ϴ��� ���մϴ�. ���� ���� = mu, ���� ���� = lambda
        mu = c - c_pivot;
        lambda = r - r_pivot;
        % ���� c�� ������ ���ͼ� c_pivot���� ���̰� ���ٸ�:
        if mu == 0
            % �׸��� r�� ������ ���ͼ� r_pivot���� ���̰� ���ٸ�:
            if lambda == 0
                % input image�� ���� ��ǥ�� ��ġ�� �ȼ����� output image�� �״�� �����մϴ�.              
                output_image(row, column) = input_image(r_pivot, c_pivot);
            % c�� ������ ���� ���̶��
            else
            output_image(row, column) = lambda*input_image(r_pivot, c_pivot) + (1-lambda)*input_image(r_pivot+1, c_pivot);
            end
        % r�� ������ ���� �����
        elseif lambda == 0
            % ���� ������ ����ؼ� ���� ������ ���ݴϴ�.
            output_image(row, column) = mu*input_image(r_pivot, c_pivot) + (1-mu)*input_image(r_pivot, c_pivot+1);
        % c, r ��� ������ �ƴ� �Ǽ��� ���Դٸ� �� �� �� ���̿� ��ġ�� ���̶� �缱�� ������ �����ؾ� �մϴ�.
        else
            % ���� ���� ���� ������ ��, �Ʒ��� �� �� �����մϴ�.
            temp1 = mu*input_image(r_pivot, c_pivot) + (1-mu)*input_image(r_pivot, c_pivot+1);
            temp2 = mu*input_image(r_pivot+1, c_pivot) + (1-mu)*input_image(r_pivot+1, c_pivot+1);
            % ���� ����� �̿��� ���� ���� ���� ������ �����մϴ�.
            output_image(row, column) = lambda* temp1 + (1-lambda)*temp2;
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% �Է� ������ uint8������ ������
output_image = uint8(output_image);