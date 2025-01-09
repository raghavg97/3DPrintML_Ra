function y = info_meas1(G)
    hxy = ent(G);
    hxy1 = HXY1(G);
    
    
    hx = HX(G);
    hy = HY(G);
    y = zeros(size(G,3),1); 
    
    for k=1:size(G,3)
        
        y(k) = (hxy(k) - hxy1(k))/(max(hx(k),hy(k)));
        
        
    end
end