function y = px(G)
    
    y = zeros(size(G,3),size(G,1));
    for k=1:size(G,3)
        for i=1:size(G,1)
            y(k,i) = y(k,i) + sum(G(i,:,k));
        end
    end
end