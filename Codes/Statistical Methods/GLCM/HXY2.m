function y = HXY2(G)
    
   y = zeros(size(G,3),1);
   p1 = px(G);
   p2 = py(G);
   for k=1:size(G,3)
       for i=1:size(G,1)
           for j = 1:size(G,2)
               y(k) = y(k) + (p1(k,i)*p2(k,j)*log((p1(k,i)*p2(k,j))+0.01));
           end
       end
   end
   y = -1*y;
end