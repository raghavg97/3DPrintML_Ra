function x =  ngldm_entropy(ngldm)

    s = size(ngldm);
    Q = ngldm(2:s(1),2:s(2));
    %log(abs(Q))
    
    x2 =- sum(sum(Q.*log(Q + 1)));
    
    x1 = sum(sum(Q));
   
    x= x2/x1;
    
end