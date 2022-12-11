%I1 = rgb2gray(imread('edm3.jpg'));

%I2 = rgb2gray(imread('milling5.jpg'));

%s = size(I1);
%I1 = I1(121:360,161:480);
%I2 = I2(121:360,161:480);
%imshow(I);
clear;
load('A_cropped_59.mat');
%load('A_Wave_59.mat');
%load('A_HPF_59');
%d('A_DCT_59');

s = size(Ic);
%s = size(Wave_I);
% s = size(HighPass_I);
%s = size(DCT_I);

p1 = zeros(s(3),1);
p2 = zeros(s(3),1);
p3 = zeros(s(3),1);
p4 = zeros(s(3),1);
p5 = zeros(s(3),1);

p6 = zeros(s(3),1);
p7 = zeros(s(3),1);
p8 = zeros(s(3),1);
p9 = zeros(s(3),1);
p10 = zeros(s(3),1);


p11 = zeros(s(3),1);
p12 = zeros(s(3),1);
p13 = zeros(s(3),1);
p14 = zeros(s(3),1);
p15 = zeros(s(3),1);
p16 = zeros(s(3),1);


for i = 1:s(3)
    offsets = [0 1;0 2; 0 3;0 4; -1 1; -2 2; -3 3; -4 4; -1 0; -2 0; -3 0; -4 0;-1 -1;-2 -2;-3 -3;-4 -4];
     
    I1 = histeq(Ic(:,:,i));
   % I1 = histeq(Wave_I(:,:,i));
  % I1 = histeq(DCT_I(:,:,i));
  % I1 = HighPass_I(:,:,i);
    G = graycomatrix(I1,'Offset',offsets,'NumLevels',255,'Symmetric',true);
      
    gs = size(G);
    gprops = graycoprops(G);
    
    G_scaled = zeros(gs);
    for g=1:gs(3)
        G_scaled(:,:,g) = G(:,:,g)./sum(sum(G(:,:,g)));
    end
    p1(i) = mean(asm(G_scaled));%Haralick 1 - Angular Second Moment
    p2(i) = mean(gprops.Contrast);%Haralick 2 -Contrast
    p3(i) = mean(gprops.Correlation);%Haralick 3 -Correlation
    p4(i) = mean(vari(G_scaled)); %Haralick 4 - Sum of Squares : Variance
    p5(i) = mean(idm(G_scaled));%Haralick 5 - Inverse Difference Moment
    p6(i) = mean(sum_mean(G_scaled));%Haralick 6 - Sum Average 
    p7(i) = mean(sum_var(G_scaled));%Haralick 7 - Sum Variance 
    p8(i) = mean(sum_ent(G_scaled));%Haralcik 8 - Sum Entropy
    p9(i) = mean(ent(G_scaled));%Haralick 9 - Entropy
    p10(i)= mean(diff_var(G_scaled));%Haralick 10 - Difference Variance 
    p11(i) = mean(diff_ent(G_scaled)); %Haralick 11 - Difference Entropy
    p12(i) = mean(info_meas1(G_scaled));   %Haralick 12, Information Measure
    p13(i) = mean(info_meas2(G_scaled)); %Haralick 13, information Measure
   % p14(i) = mean(max_corr_coeff(G_scaled)); %Haralick 14, Maximal Correlation Coefficient
    p14(i) = mean(gprops.Energy);
    p15(i) = mean(gprops.Homogeneity);
    
%     h(i) = mean(ent(G));
    i

end
%sum_var(G1)