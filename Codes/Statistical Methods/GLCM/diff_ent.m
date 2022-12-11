function y = diff_ent(G) %Difference_entropy
  
  y = zeros(size(G,3),1);
  pxy = p_xminusy(G);

   for k=1:size(y,1)
    for i=1:size(pxy,2)
        y(k) = y(k) + pxy(k,i)*log(pxy(k,i)+0.01);
    end
  end
  y =-1*y;

end