% I=imread('A5.bmp');
% 
% %Convert to grayscale
% I=rgb2gray(I); 
% imshow(I)
load('A_slm_59.mat')

HighPass_I = zeros(size(I));

for i=1:size(I,3)
  I1 = I(:,:,i);
%Determine good padding for Fourier transform
PQ = paddedsize(size(I1));

%Create a Gaussian Highpass filter 5% the width of the Fourier transform
D0 = 0.05*PQ(1);
H = hpfilter('gaussian', PQ(1), PQ(2), D0);

% Calculate the discrete Fourier transform of the image
F=fft2(double(I1),size(H,1),size(H,2));

% Apply the highpass filter to the Fourier spectrum of the image
HPFS_I = H.*F;

% convert the result to the spacial domain.
HPF_I=real(ifft2(HPFS_I)); 

% Crop the image to undo padding
HPF_I=HPF_I(1:size(I1,1), 1:size(I1,2));

%Display the "Sharpened" image
%figure, imshow(HPF_I, [])
HighPass_I(:,:,i) = mat2gray(HPF_I);
i
end

% Display the Fourier Spectrum
% Move the origin of the transform to the center of the frequency rectangle.
% Fc=fftshift(F);
% Fcf=fftshift(HPFS_I);
% use abs to compute the magnitude and use log to brighten display
% S1=log(1+abs(Fc)); 
% S2=log(1+abs(Fcf));
% figure, imshow(S1,[])
% figure, imshow(S2,[])