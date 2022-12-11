clear;
I = rgb2gray(imread('A11.bmp'));

I = double(I);

Ntu = textural_Ntu(I);

figure
hist(Ntu(:),0:6560);

% I_text = uint8(Ntu);
% figure
% imshow(I_text)    