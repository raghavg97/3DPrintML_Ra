
load('A_slm_59')
LBP_I = zeros(size(I,3),59);


for i=1:59

LBP_I(i,:) = extractLBPFeatures(I(:,:,i));
i


end