function y = sum_var(G) %Sum_Variance
    

  
  y = zeros(size(G,3),1);
  pxy = p_xplusy(G);
  
  sent = sum_ent(G);
  
  for k=1:size(G,3)
     for i = 2:(size(pxy,2)+1)
            y(k) = y(k) + (pxy(k,i-1)*((i-sent(k))^2));
     end
  end
  
  

end