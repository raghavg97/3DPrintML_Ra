function y = asm(G) %Angular second moment

   y = zeros(size(G,3),1);
   for k=1:size(G,3)
        y(k)= sum(sum(G(:,:,k).^2));
   end
   

end
