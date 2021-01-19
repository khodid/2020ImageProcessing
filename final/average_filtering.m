function output_image = average_filtering(input_image)

% 입력 영상의 크기를 알아냄 (H:높이, W:너비)
[H W] = size(input_image);

% 입력 영상을 double형으로 변경함
input_image = double(input_image);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 이 부분에 코드를 작성하세요.
%

% output image의 크기를 정합니다. 에지 무시 방식이므로 가로, 세로가 (kernel길이-1)만큼 짧아집니다.
output_image = zeros(H-8, W-8);
% 9x9 평균 필터를 정의해줍니다. 모든 원소가 1/81인 
f = ones(9, 9)/81;

% input image의 전체 행과 열을 돌면서 연산을 수행합니다.
% 필터 크기가 9x9이고, 필터의 (1,1)은 input 이미지의 (1,1)부터 (H-8, W-8)와 겹쳐질 것입니다.
for row = 1:H-8
    for col = 1:W-8
        % output image의 (row, column) 위치에 input image의 (row, column)부터
        % (row+8, column+8) 위치까지 9x9 사각형 영역을 평균 필터와 원소별 곱셈을 한 후 다 더하고, 
        % 이를 반올림해 대입합니다.
        output_image(row, col) = round(sum(sum(input_image(row:row+8,col:col+8).*f)));
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 입력 영상을 uint8형으로 변경함
output_image = uint8(output_image);