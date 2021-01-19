function output_image = histogram_equalization(input_image)

% 입력 영상의 크기를 알아냄 (H:높이, W:너비)
[H W] = size(input_image);

% 입력 영상을 double형으로 변경함
input_image = double(input_image);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% num는 밝기값이 1~i인 픽셀수를 저장합니다. input_image는 uint8형이므로 밝기값은 1~255까지 있습니다.
num = 0;
% 중복된 계산을 줄이기 위해 이미지의 총 픽셀 수를 저장해 둡니다.
n = H*W;
% input size와 똑같은 output image 공간을 만듭니다. 
output_image = zeros(H, W);

% 밝기값 1~255에 대해 반복합니다.
for i = 1:255
    % input image 중 밝기가 i인 원소는 1, 나머지는 0으로 채우는 logical 행렬을 만듭니다.
    temp = (input_image == i);
    % sum을 이용해 logical True(1) 값을 모두 더해 
    % 밝기가 i인 원소의 개수를 구하고, 1~(i-1)까지의 값에 더해 누적합을 구합니다.
    num = num + sum(sum(temp));
    % 평활화 공식에 의해 (반올림((밝기값이 1~i인 픽셀수) / (전체 픽셀수) * (밝기값 개수 - 1))) 계산
    output_image(temp) = round(num/n*244);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 입력 영상을 uint8형으로 변경함
output_image = uint8(output_image);