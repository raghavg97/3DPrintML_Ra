function y = info_meas2(G)
    hxy = ent(G);
    hxy2 = HXY2(G);
    
   
    y = zeros(size(G,3),1); 
    
    for k=1:size(G,3)
        
        y(k) = sqrt(1-exp(-2*(hxy2(k)-hxy(k))));
        
        
    end
end