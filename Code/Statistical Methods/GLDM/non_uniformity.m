function x =  non_uniformity(ngldm)

    s = size(ngldm);
    
    Q = ngldm(2:s(1),2:s(2));
    
    x2 = sum(sum(Q).^2);
    x1 = sum(sum(Q));
   
    x= x2/x1;
    
end