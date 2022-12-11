function dd = text_feature_dd(I,varargin) %Textural Feature Degree of Direction Li Wang 1990
% High value implies there are some linear structures of fundamental
% elements within the image 
    numvarargs = length(varargin);
    
    S = zeros(8,6561);
    
    if numvarargs > 0
    error('text_feature_gs:Toomanyinputs', ...
        'requires 1 input Image matrix');
    end

    
    for d = 1:8
        Ntu =  textural_Ntu(I,d);   
        S(d,:) = histc(Ntu(:),0:6560);
        S(d,:) = S(d,:)/sum(S(d,:));
    end
    
   % S = S/sum(sum(S));
    
    s4 = 0;
    for m=1:3
        s3 = 0;
        for n=m+1:4
           s1 = sum(abs(S(m,:)-S(n,:)));
           s2 = sum(S(m,:));
           
           s3 = s3 + s1/(2*s2);
        end
        s4 = s4 + s3;
    end
    
    dd = (1-s4/6)*100;
end
