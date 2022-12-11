function y = py(G)
    
    y = zeros(size(G,3),size(G,2));
    for k=1:size(G,3)
        for j=1:size(G,2)
            y(k,j) = y(k,j) + sum(G(:,j,k));
        end
    end
end