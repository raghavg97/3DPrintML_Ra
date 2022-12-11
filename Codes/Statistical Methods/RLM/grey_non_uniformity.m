function x = grey_non_uniformity(glrlm) %Gray level Non Uniformity
    
    s1 = sum((sum(glrlm).^2));
    s2 = sum(sum(glrlm));
    
    x = s1/s2;
end