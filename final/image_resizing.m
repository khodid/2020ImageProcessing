function output_image = image_resizing(input_image, a, b)

% 입력 영상의 크기를 알아냄 (H:높이, W:너비)
[H W] = size(input_image);

% 입력 영상을 double형으로 변경함
input_image = double(input_image);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 이 부분에 코드를 작성하세요.
%

% scaling을 마친 output image의 높이와 너비를 계산합니다. 버림 연산으로 정수 값으로 바꾸어 줍니다.
nH = floor(H*b);
nW = floor(W*a);
% 계산한 것을 바탕으로 output image가 들어갈 공간을 만들어줍니다.
output_image = zeros(nH, nW);

% output image의 모든 픽셀에 대해 연산합니다.
for row = 1:nH
    for column = 1:nW
        % (row, column)이 원본 영상(input image)에서 어느 위치인지 구합니다.
        % output_img에서 임의의 픽셀의 인덱스를 x, 해당 픽셀의 input_img에서의 위치를 y라고 한다면
        % (y - 1) = (변환 전 길이-1)/(변환 후 길이-1)*(x - 1)  --> 그래프로 관계 알아냄
        % 예: a = 2일 때 input = [1,2,3]이라면 : output index=[1, 2, 3, 4, 5, 6] -> [1, 1.4, 1.8, 2.2, 2.6, 3]
        r =  1 + (H-1)/(nH-1)*(row-1);
        c =  1 + (W-1)/(nW-1)*(column -1);
        % 해당 위치와 가장 가까운 4개 픽셀 중 행, 열 인덱스가 작은 쪽 인덱스를 구합니다.
        r_pivot = floor(r);
        c_pivot = floor(c);
        
        % 해당 위치가 4개 점 가운데 어떤 비율에 위치하는지 구합니다. 가로 비율 = mu, 세로 비율 = lambda
        mu = c - c_pivot;
        lambda = r - r_pivot;
        % 만약 c가 정수로 나와서 c_pivot과의 차이가 없다면:
        if mu == 0
            % 그리고 r도 정수로 나와서 r_pivot과의 차이가 없다면:
            if lambda == 0
                % input image의 정수 좌표에 위치한 픽셀값을 output image에 그대로 적용합니다.              
                output_image(row, column) = input_image(r_pivot, c_pivot);
            % c만 정수로 나온 것이라면
            else
            output_image(row, column) = lambda*input_image(r_pivot, c_pivot) + (1-lambda)*input_image(r_pivot+1, c_pivot);
            end
        % r만 정수로 나온 경우라면
        elseif lambda == 0
            % 세로 비율을 고려해서 선형 보간을 해줍니다.
            output_image(row, column) = mu*input_image(r_pivot, c_pivot) + (1-mu)*input_image(r_pivot, c_pivot+1);
        % c, r 모두 정수가 아닌 실수로 나왔다면 네 개 점 사이에 위치한 값이라 양선형 보간을 적용해야 합니다.
        else
            % 가로 방향 선형 보간을 위, 아래로 두 번 수행합니다.
            temp1 = mu*input_image(r_pivot, c_pivot) + (1-mu)*input_image(r_pivot, c_pivot+1);
            temp2 = mu*input_image(r_pivot+1, c_pivot) + (1-mu)*input_image(r_pivot+1, c_pivot+1);
            % 위의 결과를 이용해 세로 방향 선형 보간을 수행합니다.
            output_image(row, column) = lambda* temp1 + (1-lambda)*temp2;
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 입력 영상을 uint8형으로 변경함
output_image = uint8(output_image);