% ����ó�� ���� #4 (due 10/11 23:59)

% 1. 
% �����ڷḦ �����Ͽ�, caribou.tif ���� ���� 
% �ش� ������ 4, 8, 16���� ����� ������ ������ϼ���.
% (16���� ����� ������ �� �� ����� ��Ʈ���� D = [0 10;15 5]�� ����� ��)

im= imread("sample_images/caribou.tif");
D4 = [0 56; 84 28]; r4 = repmat(D4, 128, 128); 
D8 = [0 24; 36 12]; r8 = repmat(D8, 128, 128); 
D16= [0 10; 15 5]; r16 = repmat(D16, 128, 128);

im = double(im);

q = floor(im/85);  
im4 = q + (im - 85 * q > r4);   % 4�� ��� �����
im4 = uint8(im4*85);

q = floor(im/37);
im8 = q + (im - 37 * q > r8);   % 8�� ��� �����
im8 = uint8(im8*37);

q = floor(im/16);
im16 = q + (im - 16 * q > r16); % 16�� ��� �����
im16 = uint8(im16*16);

im = uint8(im);
imshow([im im4; im8 im16]);

