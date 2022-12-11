% I(:,:,1) = rgb2gray(imread('a1_1.jpeg'));
% I(:,:,2) = rgb2gray(imread('a2_1.jpeg'));
% I(:,:,3) = rgb2gray(imread('a3_1.jpeg'));
% I(:,:,4) = rgb2gray(imread('a3_3.jpeg'));
% I(:,:,5) = rgb2gray(imread('a4_2.jpeg'));
% I(:,:,6) = rgb2gray(imread('a4_3.jpeg'));
% I(:,:,7) = rgb2gray(imread('a5_1.jpeg'));
% I(:,:,8) = rgb2gray(imread('a5_4.jpeg'));
% I(:,:,9) = rgb2gray(imread('a6_2.jpeg'));
% I(:,:,10) = rgb2gray(imread('a6_4.jpeg'));
% I(:,:,11) = rgb2gray(imread('a7_2.jpeg'));
% I(:,:,12) = rgb2gray(imread('a7_3.jpeg'));
% I(:,:,13) = rgb2gray(imread('a8_1.jpeg'));
% I(:,:,14) = rgb2gray(imread('a8_5.jpeg'));
% I(:,:,15) = rgb2gray(imread('a9_2.jpeg'));
% I(:,:,16) = rgb2gray(imread('a9_3.jpeg'));
clear;
 %load('16_images_SLM.mat');
   %load('59_slm_edges.mat');
   load('A_cropped_59.mat')
    %load('B_cropped_57.mat');
%load('B_slm_57.mat');
%load('A_slm_59.mat');
%load('57_slm_B_edges.mat')
%ind = [16,33,21,41,1,59,4,25,7,31,10,14,15];

% I = rgb2gray(imread('conf3.tif'));
% I1 = rgb2gray(imread('conf2.1.tif'));
% pa1 = zeros(size(Ic,3),1);
% pa2 = zeros(size(Ic,3),1);
% pa3 = zeros(size(Ic,3),1);
% pa4= zeros(size(Ic,3),1);
% pa5 = zeros(size(Ic,3),1);
% p6 = zeros(size(Ic,3),1);
% p7 =zeros(size(Ic,3),1);
% p8 = zeros(size(Ic,3),1);
% p9 = zeros(size(Ic,3),1);
% p10 = zeros(size(Ic,3),1);
% p1 = zeros(size(ind,2),1);
% p1 = zeros(size(ind,2),1);
X1 = zeros(size(Ic,3),1);
X2 = zeros(size(Ic,3),1);
X3 = zeros(size(Ic,3),1);
X4= zeros(size(Ic,3),1);
X5 = zeros(size(Ic,3),1);
X6 = zeros(size(Ic,3),1);
X7 =zeros(size(Ic,3),1);
X8 = zeros(size(Ic,3),1);
X9 = zeros(size(Ic,3),1);
X10 = zeros(size(Ic,3),1);
X11 = zeros(size(Ic,3),1);
X12 = zeros(size(Ic,3),1);
X13 = zeros(size(Ic,3),1);
X14 = zeros(size(Ic,3),1);

p1 = zeros(size(Ic,3),1);
p2 = zeros(size(Ic,3),1);
p3 = zeros(size(Ic,3),1);

t=1;    
for i1=1:size(Ic,3)
%     
%    
%     1; 
   I1 = histeq(Ic(:,:,i1));
%     offsets = [0 1; -1 1;-1 0;-1 -1];

     N = 256; %Number of pixel intensity levels
 
 d = 1;
 a = 0;
 
 ngldm = zeros(N,(2*d+1)^2);
 
 s = size(I1);
 
    for i=1+d:(s(1)-d)
         for j = 1+d:(s(2)-d)
         c = 0;
            for kr = i-d:i+d
                for kc = j-d:j+d
                    if(abs(I1(kr,kc) - I1(i,j)) <= a)
                    c = c+1;
                    end
                end
            end
            if (c~=0)
            ngldm(I1(i,j)+1,c)= ngldm(I1(i,j)+1,c) + 1;
            end
        end
    end

    X7(t) = Small_number_emphasis(ngldm);%1
    X8(t) = Large_number_emphasis(ngldm);%2
    X9(t) = non_uniformity(ngldm);%3
    X10(t) = second_moment(ngldm);%4
    X11(t) = ngldm_entropy(ngldm); %5
%     
%     p1(t) = text_feature_bws(I1);
%     p2(t) = text_feature_gs(I1);
%     p3(t) = text_feature_dd(I1);
% %     %     p1(t) = text_feature_dd(I);
    
%      p1(t) = asm(G);
%      p2(t) = cvar(G);
%       X1(t) = dis(G);
%       X2(t) = dm(G);
%       X3(t) = ent(G);
% %      p6(t) = maxP(G);
%       X4(t) = sdm(G);
% %      p8(t) = simi(G);
%       X5(t) = sum_mean(G);
%       X6(t) = vari(G);
% f = log10(abs(fftshift(fft2(I1)).^2 ));
%  X14(t) = sum(sum(f));
% %  pa2(t) = dm(G);
% %  pa3(t) = non_uniformity(ngldm); 
% %  pa4(t) = second_moment(ngldm);
% % pa5(t) = std2(I1);
%   X13(t) = std2(I1);
    t = t+1
end

% figure
% plot(p1);
% figure
% plot(p2);
% figure
% plot(p3);
% figure
% plot(p4);
% figure
% plot(p5);

% r = xlsread('roughness values A.xlsx');
% ra = r(:,2);




