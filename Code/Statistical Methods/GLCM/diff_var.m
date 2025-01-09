function y = diff_var(G) %Difference Variance
  
 y = zeros(size(G,3),1);
 pxy = p_xminusy(G);
 for k=1:size(G,3)
   y(k)= var(pxy(k,:));
end