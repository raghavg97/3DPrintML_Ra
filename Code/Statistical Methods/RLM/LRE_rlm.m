function x = LRE_rlm(glrlm)
    
    s = size(glrlm);
    
    s1 = sum(sum(((1:s(2)).^2).*glrlm));
    s2 = sum(sum(glrlm));
    
    x = s1/s2;
end