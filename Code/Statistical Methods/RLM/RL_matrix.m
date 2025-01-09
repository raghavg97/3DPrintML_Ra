
clear;

% load('59_slm_edges.mat');

load('A_cropped_59.mat');
GLRLM = zeros(256,512,59);
for iter=1:59

I1 = edge(Ic(:,:,iter));
%I1 =floor(double(I1));

s = size(I1);
 
n = 256; %No. of gray levels
dir_vec = [0 1];

%d=1;
%if(dir_vec(1)*dir_vec(2) ~=0)
%d = (dir_vec(1)*dir_vec(2))/abs((dir_vec(1)*dir_vec(2)));
%end

glrlm = zeros(n,max(s));
flag = zeros(s(1),s(2));


    
    
    count = 1;
    i=1;j=1;
    %if(d<0)
    %    i=s(1);j=s(2);
   % end
    
    while(1)
        counted =0;
        if (i>0 && j>0 && i<=s(1) && j<=s(2) && flag(i,j) == 0)
            flag(i,j)=1;
            i_next = i+dir_vec(1);
            j_next = j+dir_vec(2);
            if (i_next>0 && j_next> 0 && i_next<=s(1) && j_next<= s(2) && I1(i_next,j_next) == I1(i,j))
                count = count+1;
                i = i_next;
                j = j_next;
                counted = 1;
            else
                 glrlm(I1(i,j)+1,count) = glrlm(I1(i,j)+1,count)+1;
            end
            
        end
        
        if (sum(sum(flag))== s(1) * s(2))
            break;
        end
%         a1 = 1; b1 = s(1);
%         a2 = 1; b2 = s(2);
%         
%         if(d<0)
%             a1 = b1; b1 =1;
%             a2 = b2; b2 =1;
%         end
            
        
        if (counted==0)
            count = 1;
            check = 0;
            for i1 = 1:s(1)
                for j1 = 1:s(2)
                    if(flag(i1,j1)==0)
                        i = i1;j=j1;
                        check= 1;
                        break;
                    end
                end
                if (check==1) 
                    break;
                end
            end
%             if(i<=s(1) && i>0)
%                 i=i+d;
%             else
%                 j=j+d;
%                 if(d<0)
%                     i=s(1)
%                 else
%                     i=1;
%                 end
%                     
%             end
               
        end
        
        
    end
    GLRLM(:,:,iter) = glrlm(:,:);
    iter
end
