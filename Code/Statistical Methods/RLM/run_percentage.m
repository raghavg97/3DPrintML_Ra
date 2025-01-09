function x = run_percentage(I,glrlm) %Gray level Non Uniformity
    %I is gray-scale image
    s = size(I);
    %s1 = sum((sum(glrlm).^2));
    s1 = sum(sum(glrlm));
    s2 = s(1)*s(2);
    
    x = s1/s2;
end