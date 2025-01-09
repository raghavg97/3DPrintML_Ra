 %I1 = I(:,:,1);
 
 clear;
load('A_cropped_59.mat');

%I1 = [4 4 6 5 4 3;4 4 5 3 0 1; 3 3 5 0 0 1;2 0 7 3 3 2;0 0 7 7 3 3;0 1 6 6 2 2];


s = size(Ic);

for i=1:s(3)
    
    I1 = Ic(:,:,i);
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
 
 i 
end
