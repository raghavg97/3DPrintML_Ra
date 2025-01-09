function x = LGRE_rlm(glrlm) %Low Gray_level Run Emphasis
    
    s = size(glrlm);
    
    s1 = sum(sum(glrlm'./(1:s(1)).^2));
    s2 = sum(sum(glrlm));
    
    x = s1/s2;
end