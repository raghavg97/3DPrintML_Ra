function y = vari(G) %Variance
 
y = zeros(size(G,3),1);

%     for k = 1:size(G,3)
%         mx = sum((1:size(G)).*sum(G(:,:,k)));
%     end
% 
%  for k=1:size(G,3)
%      for i = 1:size(G,1)
%          for j = 1:size(G,2)
%             s(k) = s(k) + (G(i,j,k)*(i-mx)^2);
%          end
%      end
%  end


    
  for k = 1:size(G,3)
     m = mean2(G(:,:,k));
     for i=1:size(G,1)
         for j=1:size(G,2)
            y(k) = y(k) + ((i-m)^2) * G(i,j,k);
         end
     end
  end   
 
end
