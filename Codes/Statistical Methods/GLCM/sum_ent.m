function y = sum_ent(G) %Sum_entropy
  
  y = zeros(size(G,3),1);
  pxy = p_xplusy(G);

   for k=1:size(y,1)
    for i=2:(size(pxy,2)+1)
        y(k) = y(k) + pxy(k,i-1)*log(pxy(k,i-1)+0.01);
    end
  end
  y =-1*y;

end