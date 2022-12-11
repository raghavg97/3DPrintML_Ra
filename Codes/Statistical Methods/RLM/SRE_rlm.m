function x = SRE_rlm(glrlm) %Short Run Emphasis
    
    s = size(glrlm);
    
    s1 = sum(sum(glrlm./(1:s(2)).^2));
    s2 = sum(sum(glrlm));
    
    x = s1/s2;
end