clear;

% load('59_slm_edges.mat');

load('A_cropped_59.mat');

glrmatrix = zeros(256,512,59);
rl_features = zeros(59,11);

for i=1:size(Ic,3)
   [GLRLMS,~]= grayrlmatrix(histeq(Ic(:,:,i)),'NumLevels',256);
   rl_features(i,:) = mean(grayrlprops(GLRLMS));
   glrmatrix(:,:,i) = GLRLMS{1};
   i
   
    
    
end