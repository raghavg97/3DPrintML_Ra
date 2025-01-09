function y = HY(G)
    
   y = zeros(size(G,3),1);
   %p1 = px(G);
   p2 = py(G);
   for k=1:size(G,3)
       for j=1:size(G,2) 
               y(k) = y(k) + p2(k,j)*log(p2(k,j)+0.01);
       end
   end
   
   y = -y;
end