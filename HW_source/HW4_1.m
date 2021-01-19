% 영상처리 과제 #4 (due 10/11 23:59)

% 1. 
% 강의자료를 참조하여, caribou.tif 영상에 대해 
% 해당 영상이 4, 8, 16개의 출력을 갖도록 디더링하세요.
% (16개의 출력을 갖도록 할 땐 디더링 매트릭스 D = [0 10;15 5]를 사용할 것)

im= imread("sample_images/caribou.tif");
D4 = [0 56; 84 28]; r4 = repmat(D4, 128, 128); 
D8 = [0 24; 36 12]; r8 = repmat(D8, 128, 128); 
D16= [0 10; 15 5]; r16 = repmat(D16, 128, 128);

im = double(im);

q = floor(im/85);  
im4 = q + (im - 85 * q > r4);   % 4개 출력 디더링
im4 = uint8(im4*85);

q = floor(im/37);
im8 = q + (im - 37 * q > r8);   % 8개 출력 디더링
im8 = uint8(im8*37);

q = floor(im/16);
im16 = q + (im - 16 * q > r16); % 16개 출력 디더링
im16 = uint8(im16*16);

im = uint8(im);
imshow([im im4; im8 im16]);

