function y = p_xminusy(G) %Px+y from Haralick 1973
    s = size(G); 
    Ng = s(1) +1;%No. of grey levels = s(1)+1= s(2)+1
    y = zeros(s(3),Ng);
    
    for m = 1:s(3)
        for k =1:Ng
            for i=1:Ng-1
                for j=1:Ng-1
                    if(abs(i-j)==k)
                        y(m,k) = y(m,k) + G(i,j,m);
                    end
                end
            end
        end
    end              
end