clear;
    load('A_cropped_59.mat');
p1 = zeros(size(Ic,3),1);
p2 = zeros(size(Ic,3),1);
p3 = zeros(size(Ic,3),1);
p4 = zeros(size(Ic,3),1);
p5 = zeros(size(Ic,3),1);
p6 = zeros(size(Ic,3),1);
p7 = zeros(size(Ic,3),1);
p8 = zeros(size(Ic,3),1);
p9 = zeros(size(Ic,3),1);
p10 = zeros(size(Ic,3),1);
  
t = 1;
for i =1:59
%f = log10(abs(fftshift(fft2(Ic(:,:,i))).^2 ));

F=fft2(Ic(:,:,i));
%S=fftshift(log(1+abs(F)));
S = abs(F).^2;
%imshow(S,[]);
s = S(2:512,2:512)./sum(sum(S(2:512,2:512)));

idx =0;idy =0;
m = s(1,1);
for i1=1:size(s,1)
    for j1=1:size(s,2)
        if(s(i1,j1)>m)
            m = s(i1,j1);
            idx = i1;
            idy = j1;
        end
    end
end

 p1(t) = sqrt(idx.^2+idy.^2);       

% %p2(t) = var(reshape(f,[size(f,1)*size(f,2),1]));
 p2(t) = max(eig(cov(s)));
 p3(t) = sum(sum(S(2:512,2:512)))/(512^2-1);
 p4(t) = S(1,1)/sum(sum(S));
 p5(t) = sqrt(min(abs(eig(cov(S))))/max(abs(eig(cov(S)))));
 p6(t) = sum(sum(sqrt(S)));
 %[idx idy]
 t = t+1
     
end