function y = sum_mean(G) %Sum Mean
 
y = zeros(size(G,3),1);
pxy = p_xplusy(G);

  for k=1:size(y,1)
    for i=2:(size(pxy,2)+1)
        y(k) = y(k) + i*pxy(k,i-1);
    end
  end

     
end
