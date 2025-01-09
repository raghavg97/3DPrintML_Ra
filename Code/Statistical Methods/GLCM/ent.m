function y = ent(G) %Entropy
 
s = zeros(size(G,3),1);

 for k=1:size(G,3)
     for i = 1:size(G,1)
         for j = 1:size(G,2)
            s(k) = s(k) + (G(i,j,k)*log(abs(G(i,j,k)+0.01)));
         end
     end
 end
 
 y =-1*s;
end
