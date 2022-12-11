function y = dis(G) %DISSIMILARITY

 
s = zeros(size(G,3),1);

 for k=1:size(G,3)
     for i = 1:size(G,1)
         for j = 1:size(G,2)
            s(k) = s(k) + (G(i,j,k)*abs(i-j));
         end
     end
 end

 y = mean(s);
   

end