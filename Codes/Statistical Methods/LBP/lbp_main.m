clear;
load('A_slm_59.mat');
I1 = I(:,:,14);
%I1 = rgb2gray(imread('A1.jpg'));
% I1 = (imread('A1.bmp'));
im_size = size(I1);
cell_size = [16,16];
size_of_icell = floor(im_size(1)/cell_size(1))*floor(im_size(1)/cell_size(1));
I_cell = zeros(cell_size(1),cell_size(2),size_of_icell);

t=1;
for i = 1:cell_size(1):im_size(1)
    for j = 1:cell_size(2):im_size(2)
        if( ((i+cell_size(1)) < im_size(1)) && ((j+cell_size(2)) < im_size(2)))
            I_cell(:,:,t) = I1(i:(i+cell_size(1)-1),j:(j-1+cell_size(2)));
            t=t+1;
        end
    end
end
t=t-1;
I_newcell = zeros(cell_size(1)-2,cell_size(2)-2,t);

for i=1:t
    Im = I_cell(:,:,i);
    s = size(Im);
    pix_updated = zeros(s(1)-2,s(2)-2);
    bin_mat = zeros(3,3);
    for p = 2:(s(1)-1)
        for q = 2:(s(2)-1)
            bin_count = 0;
            pr=1;
            for p_neigh = p-1:p+1
                pc = 1;
                for q_neigh = q-1:q+1
                    %if(p_neigh ~= p && q_neigh ~=q)
                    bin_mat(pr,pc) = (Im(p,q)<Im(p_neigh,q_neigh));
                    pc = pc+1;
                    %end
                end
                 pr = pr +1; 
            end  
            pix_updated(p-1,q-1) = sum(sum(bin_mat .* [1 2 4;128 0 8;64 32 16]));
        end
    end
    %pix_updated
    I_newcell(:,:,i) = pix_updated(:,:);
    
end

t1 = 1;

for i = 1:(cell_size(1)-2):(floor(im_size(1)/cell_size(1))*(cell_size(1)-2))
    for j = 1:(cell_size(1)-2):(floor(im_size(2)/cell_size(2))*(cell_size(2)-2))
        if( ((i+cell_size(1)-2) < (floor(im_size(1)/cell_size(1))*(cell_size(1)-2))) && ((j+cell_size(2)-2) < (floor(im_size(2)/cell_size(2))*(cell_size(2)-2))))
            I_new(i:i+(cell_size(1)-3),j:(j+cell_size(2)-3)) = I_newcell(:,:,t1)  ;
            t1 = t1+1;
        end
    end
end
figure
imhist(uint8(I_new));

figure
imshow(uint8(I_new));

