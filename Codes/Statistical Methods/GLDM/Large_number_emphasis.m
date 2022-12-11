function x =  Large_number_emphasis(ngldm)

    s = size(ngldm);
    
    M = ngldm(2:s(1),2:s(2)).*((1:(s(2)-1)).^2);
    x1 = sum(sum(ngldm(2:s(1),2:s(2))));
   
    x= sum(sum(M))/x1;
    
end