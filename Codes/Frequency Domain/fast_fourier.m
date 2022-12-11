clear;
I = rgb2gray(imread('A1.bmp'));
%I=zeros(30,30);

%With a white rectangle in it.
%I(5:24,13:17)=1;

imshow(I);

 % F = fft2(I);
%F2 = abs(F);

F=fft2(I, 256, 256);

%F2=abs(F);

F2=fftshift(F);
    
F2=abs(F2);
F2=log(1+F2);

figure,imshow(F2,[])  


for i > 




