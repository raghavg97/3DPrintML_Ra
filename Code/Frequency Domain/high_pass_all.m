% I=imread('A5.bmp');
% 
% %Convert to grayscale
% I=rgb2gray(I); 
% imshow(I)

load('A_cropped_59');

%Determine good padding for Fourier transform
PQ = paddedsize(size(I));

%Create a Gaussian Highpass filter 5% the width of the Fourier transform
D0 = 0.05*PQ(1);
H = hpfilter('gaussian', PQ(1), PQ(2), D0);

% Calculate the discrete Fourier transform of the image
F=fft2(double(I),size(H,1),size(H,2));

% Apply the highpass filter to the Fourier spectrum of the image
HPFS_I = H.*F;

% convert the result to the spacial domain.
HPF_I=real(ifft2(HPFS_I)); 

% Crop the image to undo padding
HPF_I=HPF_I(1:size(I,1), 1:size(I,2));

%Display the "Sharpened" image
figure, imshow(HPF_I, [])

% Display the Fourier Spectrum
% Move the origin of the transform to the center of the frequency rectangle.
Fc=fftshift(F);
Fcf=fftshift(HPFS_I);
% use abs to compute the magnitude and use log to brighten display
S1=log(1+abs(Fc)); 
S2=log(1+abs(Fcf));
figure, imshow(S1,[])
figure, imshow(S2,[])