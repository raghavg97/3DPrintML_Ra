function y = max_corr_coeff(G)
    y = zeros(size(G,3),1);
    p1 = px(G);
   p2 = py(G);
    Q = zeros(size(G));
    for k=1:size(G,3)
        for p = 1:size(G,1)
            for q =1:size(G,2)
                for r = 1:size(G,2)
                    Q(p,q,k) = Q(p,q,k) + ((G(p,r,k)*G(q,r,k))/(p1(k,p)*p2(k,r)))
                end
            end
        end
    end
     y = Q;
%      for k=1:size(Q,3)
%          k
%          e = eig(Q(:,:,k));
%          y(k) = sqrt(e(2));
%      end
end