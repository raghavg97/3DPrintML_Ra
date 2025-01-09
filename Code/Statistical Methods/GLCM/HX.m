function y = HX(G)
    
   y = zeros(size(G,3),1);
   p1 = px(G);
   %p2 = py(G);
   for k=1:size(G,3)
       for i=1:size(G,1) 
               y(k) = y(k) + p1(k,i)*log(p1(k,i)+0.01);
       end
   end
   
   y = -y;
end