function output_image = image_rotation(input_image, c)

% 입력 영상의 크기를 알아냄 (H:높이, W:너비)
[H W] = size(input_image);

% 입력 영상을 double형으로 변경함
input_image = double(input_image);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 회전 변환 행렬을 구해 둡니다.
m = [cosd(c), sind(c); -sind(c), cosd(c)];

% 출력 영상의 크기를 구하기 위해 각 꼭지점이 어디에 위치하는지 구하겠습니다.
% [회전한 x좌표 ; 회전한 y좌표] = [변환 행렬의 역행렬] * [원본 x좌표; 원본 y좌표]
% (1, 1), (1, W), (H, 1), (H, W) 이 네 점의 회전한 좌표를 계산합니다
points = inv(m)*[1 1 H H; 1 W 1 W];
% 행, 열 좌표의 최대값을 구하고, 그에 가까운 정수 중 큰 쪽을 가져옵니다.
indmax = ceil(max(points'));
% 행, 열 좌표의 최소값을 구하고, 그에 가까운 정수 중 작은 쪽을 가져옵니다.
indmin = floor(min(points'));
% 회전한 영상을 다 담을 수 있는 너비와 높이를 구합니다.
nH = indmax(1) - indmin(1);
nW = indmax(2) - indmin(2);
% 앞서 구한 너비와 높이를 이용해 output 영상이 들어갈 공간을 선언합니다.
output_image = zeros(nH, nW);

% output image의 각 픽셀에 대해 계산합니다.
for row = 1:nH
    for col = 1:nW
        % 변환 행렬을 이용해 회전한 (row,col) 위치를 다시 원래대로 돌렸을 때의 위치를 구합니다.
        index = m*[row + indmin(1) ; col + indmin(2)];
        % 만약 위치가 원본 영상의 범위를 벗어난다면
        if or(or(index(1)<1, index(1)>H),or(index(2)<1, index(2)>W))
            % 그 영역에는 0(검정)을 채웁니다.
            output_image(row, col) = 0;
        % 만약 위치가 원본 영상의 범위를 벗어나지 않는다면
        else
            % 값을 각각 반올림해 가장 가까운 픽셀의 좌표를 구하고(최근접보간), 해당 픽셀의 값을
            % output 영상의 (row, col) 위치에 대입합니다.
            output_image(row, col) = input_image(round(index(1)), round(index(2)));
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 입력 영상을 uint8형으로 변경함
output_image = uint8(output_image);