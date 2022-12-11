function x = LRHGE_rlm(glrlm) %Long Run High Gray-level Emphasis
    
    s = size(glrlm);
    
    s1 = 0;
    
    for i=1:s(1)
        for j =1:s(2)
            s1 = s1 + glrlm(i,j)*((j^2)*(i^2));
        end
    end
    
    s2 = sum(sum(glrlm));
    
    x = s1/s2;
end