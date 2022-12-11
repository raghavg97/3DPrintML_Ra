function x = SRHGE_rlm(glrlm) %Short Run High Gray-level Emphasis
    
    s = size(glrlm);
    
    s1 = 0;
    
    for i=1:s(1)
        for j =1:s(2)
            s1 = s1 + glrlm(i,j)*((i^2)/(j^2));
        end
    end
    
    s2 = sum(sum(glrlm));
    
    x = s1/s2;
end