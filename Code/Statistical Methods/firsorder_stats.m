clear;
load('A_cropped_59.mat');

s =size(Ic);

X = zeros(s(3),6);
for i=1:s(3)
   
    I = histeq(Ic(:,:,i));

    X(i,1) = mean2(I);    %1
    X(i,2) = var(double(I(:))); %2
    X(i,3) = skewness(double(I(:)));%3
    X(i,4) = kurtosis(double(I(:)));%4 
    X(i,5) = sum(I(:).^2);%5
    X(i,6) = entropy(I);%6
    
    %X(i,3) = std(double(I(:)));
    i
end