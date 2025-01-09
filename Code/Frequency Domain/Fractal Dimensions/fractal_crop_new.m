clear;

% load('A_Cropped_59');
load('A_Slm_59');
a = zeros(59,25);
b = zeros(59,25);
c = zeros(59,1);
d = zeros(59,1);

for i=1:59
    
    I1 = I(:,:,i);
    
    rc = @(x) floor(((max(x)-min(x))/5))+ 1;
    I1= colfilt(I1, [5 5],'sliding', rc);
    
    [a(i,:), b(i,:), c(i), d(i)]  = fdsurfft(I1);
    
    FD(i) = (6+c(i))/2;
%     FD(i) = sfta(histeq(I(:,:,i)),4);
    i
end

close all;

