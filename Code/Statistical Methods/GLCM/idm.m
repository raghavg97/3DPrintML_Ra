function y = idm(G) %Inverse Difference Moment
    s = size(G);
    y = zeros(s(3),1);
    
    for k=1:s(3)
        for i = 1:s(1)
            for j=1:s(2)
                y(k) = y(k) + (G(i,j,k)/(1+(i-j)^2));
            end 
        end
    end
    
    
    

end