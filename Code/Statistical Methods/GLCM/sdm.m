function y = sdm(G) %Second Diagonal Moment
 
s = zeros(size(G,3),1);
t = zeros(size(G,3),1);

 for k=1:size(G,3)
     for j = 1:size(G,2)
         for i = 1:size(G,1)
            t(k) = t(k) + (0.5*G(i,j,k)*abs(i-j));
         end
        s(k) = s(k) + j *t(k);    
     end
 end
 
 y = mean(s);
end